# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cloud9::ProductType.create(
    name: "Users",
    description: "Denotes Per Seat Licenses",
    invoice_name: "Users",
    invoice_description: "Per Seat Licenses for access to Cloud9"
)

Cloud9::ProductType.create(
    name: "Hardware",
    description: "Components used to manufacture a Virtual Server"
)

Cloud9::ProductType.create(
    name: "Software",
    description: "Pre-Installed on the virtual server"
)

Cloud9::ProductType.create(
    name: "Software Licensure",
    description: "Licenses to run software on your virtual server"
)

Cloud9::ProductType.create(
    name: "Labor",
    description: "Building, maintaining, or managing your server"
)

Cloud9::ProductType.create(
    name: "Data Center",
    description: "Where your virtual server resides"
)

Cloud9::ProductType.create(
    name: "Miscellaneous Fees",
    description: "Miscellaneous"
)

#Placeholder Customer for planning and orders
#todo this should be set to the back office channel to make sure they are receiving emails, notifications, etc. This is taken care of in the configuration settings
c = Cloud9::Customer.create(
    first_name: Settings.cloud9_customer_first_name,
    last_name: Settings.cloud9_customer_last_name,
    organization_name: Settings.cloud9_customer_organization_name,
    email: Settings.cloud9_customer_email
)


