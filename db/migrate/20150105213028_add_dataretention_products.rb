class AddDataretentionProducts < ActiveRecord::Migration
  def change

    p1 = Cloud9::Product.create(
        name: "30 Days Retention",
        description: "Backups of essential data on VMs",
        product_type_id: 5,
        active: true,
        invoice_description: "Rolling back-ups for 30 days",
        unit_price: true
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 0
    )

    p1 = Cloud9::Product.create(
        name: "Yearly Retention",
        description: "Backups of essential data on VMs",
        product_type_id: 5,
        active: true,
        invoice_description: "Rolling back-ups for 30 days & Yearly on the 1st business day after back-up",
        unit_price: true
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 10
    )

    p1 = Cloud9::Product.create(
        name: "Quarterly Retention",
        description: "Backups of essential data on VMs",
        product_type_id: 5,
        active: true,
        invoice_description: "Rolling back-ups for 30 days & Quarterly back-up for 4 months",
        unit_price: true
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 40
    )

    p1 = Cloud9::Product.create(
        name: "Monthly Retention",
        description: "Backups of essential data on VMs",
        product_type_id: 5,
        active: true,
        invoice_description: "Rolling back-ups for 30 days & Monthly back-up for 11 months",
        unit_price: true
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 125
    )

    p1 = Cloud9::Product.create(
        name: "Weekly Retention",
        description: "Backups of essential data on VMs",
        product_type_id: 5,
        active: true,
        invoice_description: "Rolling back-ups for 30 days & Weekly back-up for 48 weeks",
        unit_price: true
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 400
    )

  end
end
