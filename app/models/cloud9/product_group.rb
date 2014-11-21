# == Schema Information
#
# Table name: product_groups
#
#  id                  :integer          not null, primary key
#  name                :string(255)
#  description         :text
#  invoice_name        :string(255)
#  invoice_description :text
#  active              :boolean
#  created_at          :datetime
#  updated_at          :datetime
#

class Cloud9::ProductGroup < ActiveRecord::Base
  include Concerns::Invoiceable

  has_many :requirements, as: :requireable
  has_and_belongs_to_many :products

  after_create :defaults

  def defaults
    default_invoice_names
  end
end
