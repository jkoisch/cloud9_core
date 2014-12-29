class Invoicing

  def self.build
    @customer = Cloud9::Customer.new
    new(@customer)
  end

  def initialize(customer)
    @customer = customer
  end

  def call

    invoice = Cloud9::Invoice.new

    @customer.systems.each do |sys|
      group = Cloud9::InvoiceGroup.new("Virtual Machine", sys.virtual_machine_identifier)

      sys.components.each do |comp|
        line = Cloud9::InvoiceLine.create_from(comp)
        if line.present?
          group.invoice_lines << line
          group.total += line.line_total
        end
      end

      invoice.invoice_groups << group if group.invoice_lines.present?
    end

    @customer.non_system_components.each do |comp|
      group = Cloud9::InvoiceGroup.new("Other", comp.product.invoice_name)
      line = Cloud9::InvoiceLine.create_from(comp)
      if line.present?
        group.invoice_lines << line
        group.total += line.line_total
      end

      if group.invoice_lines.present?
        invoice.invoice_groups << group
        invoice.total += group.total
      end
    end

    @customer.invoices << invoice
    @customer.save

  end


end