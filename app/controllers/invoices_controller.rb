class InvoicesController < ApplicationController
  # Type stuff here

  def show
    invoice_by_external_id
  end

  def check
    invoice
  end


  private

    def invoice
      @invoice = Cloud9::Invoice.find(params[:id])
    end

    def invoice_by_external_id
      @invoice = Cloud9::Invoice.find_by(external_id: params[:id])
    end
end