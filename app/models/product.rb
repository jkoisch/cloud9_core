class  Product < ActiveRecord::Base
  include Concerns::Invoiceable

  has_many :requirements, as: :requireable
  has_many :product_licenses
  has_many :product_costs
  has_many :product_prices
  belongs_to :product_type
  has_and_belongs_to_many :product_groups
  has_and_belongs_to_many :orders



  after_create :defaults

  def defaults
    default_invoice_names
  end

end