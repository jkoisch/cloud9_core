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
    invoice.total = 0

    @customer.systems.each do |sys|
      invoice.systems << sys
      group = Cloud9::InvoiceGroup.new(:name => "Virtual Machine", :description => sys.vm)

      group_total = 0
      sys.components.each do |comp|
        line = Cloud9::InvoiceLine.create_from(comp)
        if line.present?
          group.invoice_lines << line
          group_total += line.line_total.to_i
        end
      end

      group.total = group_total
      invoice.total += group_total
      invoice.invoice_groups << group if group.invoice_lines.present?
    end

    @customer.non_system_components.each do |comp|
      invoice.components << comp
      group = Cloud9::InvoiceGroup.new(:name => "Other", :description => comp.product.invoice_name)

      group_total = 0
      line = Cloud9::InvoiceLine.create_from(comp)
      if line.present?
        group.invoice_lines << line
        group_total += line.line_total.to_i
      end

      if group.invoice_lines.present?
        group.total = group_total
        invoice.invoice_groups << group
      end

      invoice.total += group_total
    end

    invoice.ready
    @customer.invoices << invoice
    @customer.save
    invoice
  end

  def sample
    invoice = self.call
    invoice.sample
    invoice.save
    invoice
  end


end