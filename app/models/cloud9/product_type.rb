# == Schema Information
#
# Table name: product_types
#
#  id                     :integer          not null, primary key
#  name                   :string(255)
#  description            :text
#  parent_product_type_id :integer
#  invoice_name           :string(255)
#  invoice_description    :text
#  created_at             :datetime
#  updated_at             :datetime
#

class Cloud9::ProductType < ActiveRecord::Base
  include Concerns::Invoiceable

  has_many :products
  validates_presence_of :name, :description

  after_create :defaults

  def defaults
    default_invoice_names
  end

end
