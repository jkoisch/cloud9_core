class AddMoreProductTypes < ActiveRecord::Migration
  def change

    Cloud9::ProductType.create(
        name: "backup",
        description: "Backup your data"
    )

    Cloud9::ProductType.create(
        name: "data retention",
        description: "Keep your backups"
    )

    Cloud9::ProductType.create(
        name: "quickbooks",
        description: "Quickbooks software packages"
    )

    Cloud9::ProductType.create(
        name: "microsoft exchange license",
        description: "Microsoft Exchange License"
    )

    Cloud9::ProductType.create(
        name: "microsoft office license",
        description: "Microsoft Office License"
    )

    Cloud9::ProductType.create(
        name: "vip support",
        description: "End User Support"
    )

    Cloud9::ProductType.create(
        name: "users",
        description: "Denotes Per Seat Licenses",
        invoice_name: "Users",
        invoice_description: "Per Seat Licenses for access to Cloud9"
    )

    Cloud9::ProductType.create(
        name: "hardware",
        description: "Components used to manufacture a Virtual Server"
    )

    Cloud9::ProductType.create(
        name: "software",
        description: "Pre-Installed on the virtual server"
    )

    Cloud9::ProductType.create(
        name: "software licensure",
        description: "Licenses to run software on your virtual server"
    )

    Cloud9::ProductType.create(
        name: "labor",
        description: "Building, maintaining, or managing your server"
    )

    Cloud9::ProductType.create(
        name: "miscellaneous fees",
        description: "Miscellaneous"
    )

    add_column :products, :percentage_price, :boolean
    add_column :products, :contract_percentage, :integer

  end
end
