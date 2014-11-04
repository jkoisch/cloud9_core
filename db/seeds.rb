# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ProductType.create(
    name: "Users",
    description: "Denotes Per Seat Licenses",
    invoice_name: "Users",
    invoice_description: "Per Seat Licenses for access to Cloud9"
)

ProductType.create(
    name: "Hardware",
    description: "Components used to manufacture a Virtual Server"
)

ProductType.create(
    name: "Software",
    description: "Pre-Installed on the virtual server"
)

ProductType.create(
    name: "Software Licensure",
    description: "Licenses to run software on your virtual server"
)

ProductType.create(
    name: "Labor",
    description: "Building, maintaining, or managing your server"
)

ProductType.create(
    name: "Data Center",
    description: "Where your virtual server resides"
)

ProductType.create(
    name: "Miscellaneous Fees",
    description: "Miscellaneous"
)

prod1 = Product.create(
    name: "Cloud9 User Access License",
    description: "Entitles one user access to Cloud9 resources"
)

Pr


