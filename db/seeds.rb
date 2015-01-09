# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Placeholder Customer for planning and orders
#todo this should be set to the back office channel to make sure they are receiving emails, notifications, etc. This is taken care of in the configuration settings
c = Cloud9::Customer.create(
    organization_name: Settings.cloud9_customer_organization_name
)

t = Cloud9::Contact.create(
                       name: Settings.cloud9_customer_first_name + ' ' + Settings.cloud9_customer_last_name,
                       email: Settings.cloud9_customer_email,
                       cloud9_customer_id: c.id
)





Cloud9::ProductType.create(
    name: "ram",
    description: "Random Access Memory for your server"
)

Cloud9::ProductType.create(
    name: "hard drive",
    description: "Hard Drive Space for your server"
)

Cloud9::ProductType.create(
    name: "cpu",
    description: "Processors for your server"
)

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



pt1 = Cloud9::ProductType.find_by(name: "ram")
Cloud9::Product.find_or_create_by(name: "ram unit", active: true, description: "A Unit of RAM used in a VM",product_type_id: pt1.id, status: "production", unit_price: true, required_quantity: 2)

pt1 = Cloud9::ProductType.find_by(name: "hard drive")
Cloud9::Product.find_or_create_by(name: "hard drive boot unit", active: true, description: "A Unit of Boot Hard Drive used in a VM", product_type_id: pt1.id, status: "production", unit_price: true, required_quantity: 25)
Cloud9::Product.find_or_create_by(name: "hard drive data unit", active: true, description: "A Unit of Data Hard Drive used in a VM", product_type_id: pt1.id, status: "production", unit_price: true, required_quantity: 25)

pt1 = Cloud9::ProductType.find_by(name: "cpu")
Cloud9::Product.find_or_create_by(name: "cpu unit", active: true, description: "A Unit of Processor used in a VM", product_type_id: pt1.id, status: "production", unit_price: true, required_quantity: 1)

pt1 = Cloud9::ProductType.find_by(name: "users")
Cloud9::Product.find_or_create_by(name: "vm user", active: true, description: "A user on a VM", product_type_id: pt1.id, status: "production", unit_price: true, required_quantity: 0)
