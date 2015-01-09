class InvoiceMailer < ActionMailer::Base
  default from: "from@example.com"

  def bill(invoice)
    @invoice = invoice
    @customer = @invoice.customer
    @url = invoice_url(@invoice.external_id)


    test = ['jkoisch@gmail.com']
    add_list = ""
    test.each do |con|
    # invoice.customer.contact_list.each do |con|
      add_list << "#{con},"
    end
    #todo remove the trailing comma
    # to_names
    mail(to: add_list, subject: "Cloud9 Realtime Invoice: #{invoice.bill_date.strftime '%c'}") unless add_list.blank?

  end
end
