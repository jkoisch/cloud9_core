class ProductGroup < ActiveRecord::Base
  include Concerns::Invoiceable

  has_many :requirements, as: :requireable
  has_and_belongs_to_many :products

  after_create :defaults

  def defaults
    default_invoice_names
  end
end