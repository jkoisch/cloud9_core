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
    total = 0
    sub_total = 0

    @customer.systems.each do |sys|

      sys.components.each { |comp| puts "&*^%&^%&*^%&^%&*^%&*^% #{comp.inspect}"}

      invoice.systems << sys
      group = Cloud9::InvoiceGroup.new(:name => "Virtual Machine", :description => sys.vm)

      sub_total = 0
      sys.components.each do |comp|
        line = Cloud9::InvoiceLine.create_from(comp)
        if line.present?
          group.invoice_lines << line
          sub_total += line[:line_total].to_i
          total += line[:line_total].to_i
        end
      end
      group[:total] = sub_total
      invoice.invoice_groups << group
    end

    @customer.non_system_components.each do |comp|
      invoice.components << comp
      group = Cloud9::InvoiceGroup.new(:name => "Other", :description => comp.product.invoice_name)

      sub_total = 0
      line = Cloud9::InvoiceLine.create_from(comp)
      if line.present?
        group.invoice_lines << line
        sub_total += line[:line_total].to_i
        total += line[:line_total].to_i
      end

      if group.invoice_lines.present?
        group[:total] = sub_total
        invoice.invoice_groups << group
      end

    end

    invoice.ready
    invoice[:total] = total
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

  def create
    invoice = self.call
    invoice.send_to_user
    invoice.save
    # InvoiceMailer.bill(invoice)
    InvoiceMailer.delay.bill(invoice)
  end


end