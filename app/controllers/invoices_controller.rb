class InvoicesController < ApplicationController
  # Type stuff here

  def show
    invoice
  end



  private

    def invoice
      @invoice = Cloud9::Invoice.find(params[:id])
    end
end