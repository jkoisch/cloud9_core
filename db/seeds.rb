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


