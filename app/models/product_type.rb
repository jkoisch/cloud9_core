class ProductType < ActiveRecord::Base
  include Concerns::Invoiceable
  after_create :defaults

  def defaults
    default_invoice_names
  end


end