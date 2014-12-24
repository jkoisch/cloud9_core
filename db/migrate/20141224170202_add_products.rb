class AddProducts < ActiveRecord::Migration
  def change

    pt1 = Cloud9::ProductType.find_by(name: "ram")
    Cloud9::Product.find_or_create_by(name: "ram unit", active: true, description: "A Unit of RAM used in a VM",product_type_id: pt1.id, status: "production", unit_price: true, required_quantity: 2)

    pt1 = Cloud9::ProductType.find_by(name: "hard drive")
    Cloud9::Product.find_or_create_by(name: "hard drive boot unit", active: true, description: "A Unit of Boot Hard Drive used in a VM", product_type_id: pt1.id, status: "production", unit_price: true, required_quantity: 25)
    Cloud9::Product.find_or_create_by(name: "hard drive data unit", active: true, description: "A Unit of Data Hard Drive used in a VM", product_type_id: pt1.id, status: "production", unit_price: true, required_quantity: 25)

    pt1 = Cloud9::ProductType.find_by(name: "cpu")
    Cloud9::Product.find_or_create_by(name: "cpu unit", active: true, description: "A Unit of Processor used in a VM", product_type_id: pt1.id, status: "production", unit_price: true, required_quantity: 1)

    pt1 = Cloud9::ProductType.find_by(name: "users")
    Cloud9::Product.find_or_create_by(name: "vm user", active: true, description: "A user on a VM", product_type_id: pt1.id, status: "production", unit_price: true, required_quantity: 0)

  end
end
