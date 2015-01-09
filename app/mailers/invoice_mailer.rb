class InvoiceMailer < ActionMailer::Base
  default from: "from@example.com"

  def bill(invoice)
    test = ['jkoisch@gmail.com']
    test.each do |con|
    # invoice.customer.contact_list.each do |con|
      mail(to: con, subject: "Cloud9 Invoice: #{invoice.bill_date.strftime '%c'}")
    end

  end
end
