class Invoice < ActiveRecord::Base

  has_many :orders
  has_many :invoice_groups
  has_many :invoice_lines, through :invoice_groups

end