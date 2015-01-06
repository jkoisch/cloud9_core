class AddBackupProducts < ActiveRecord::Migration
  def change

    p1 = Cloud9::Product.create(
        name: "Daily Back-up",
        description: "Backups of essential data on VMs",
        product_type_id: 4,
        active: true,
        invoice_description: "Back-up done at 12:00 a.m. PST"
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 0
    )

    p1 = Cloud9::Product.create(
        name: "Bi-Daily Back-up",
        description: "Backups of essential data on VMs",
        product_type_id: 4,
        active: true,
        invoice_description: "Back-up done at 12:00 p.m. & 12:00 a.m. PST"
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 5000
    )

    p1 = Cloud9::Product.create(
        name: "Quad Daily Back-up",
        description: "Backups of essential data on VMs",
        product_type_id: 4,
        active: true,
        invoice_description: "Back-up done at 6:00 a.m. & 12:00 p.m., 6:00 p.m. & 12:00 a.m. PST"
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 9000
    )

    p1 = Cloud9::Product.create(
        name: "Hourly Back-up",
        description: "Backups of essential data on VMs",
        product_type_id: 4,
        active: true,
        invoice_description: "Back-up done at the top of every hour"
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 45000
    )

  end
end
