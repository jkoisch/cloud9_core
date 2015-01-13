class InvoicesController < ApplicationController
  # Type stuff here

  def show
    #todo ... may want to not make this available if it is archived (invoice.archived?)
    invoice_by_external_id
  end

  def pay
    invoice_by_external_id
  end

  def check
    invoice
  end

  def settle
    invoice_by_external_id
    trans = Authorizenet::Transaction.new()
    response = trans.call(invoice_params[:cc_number], invoice_params[:cc_expiration], invoice_total)
    if response.success?
      flash[:notice] = "Credit Card Transaction successful. Thanks"
      @invoice.pay
      @invoice.save
    else
      flash[:error] = response.response_reason_text
      @invoice.error("#{response.response_reason_text}, Response_Code: #{response.response_code}")
      @invoice.save
    end

  end


  private

    def invoice_params
      params.require(:cloud9_invoice).permit(:cc_number, :cc_expiration)
    end

    def invoice
      @invoice = Cloud9::Invoice.find(params[:id])
    end

    def invoice_total
      inv = Cloud9::Invoice.select(:total, :workflow_state).find_by(external_id: params[:id])
      (inv[:total] / 100).to_f
    end

    def invoice_by_external_id
      @invoice = Cloud9::Invoice.find_by(external_id: params[:id])
    end
end