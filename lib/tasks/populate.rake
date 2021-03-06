namespace :db do

  require 'ffaker'
  include Faker

  desc "Erases and Fills the Database"
  task populate: :environment do

    Cloud9::Product.destroy_all
    Cloud9::Cost.destroy_all

    20.times do
      p = Cloud9::Product.create(
        name: Faker::Product.product_name,
        description: Faker::HipsterIpsum.words(12).join(' '),
        active: true,
        status: "staged",
        product_type_id: 3
      )

      c = Cloud9::Cost.create(
          amount: Faker::Address.building_number,
          product_id: p.id,
          active: true
      )
    end

    #Generate some non active costs
    Cloud9::Product.all.each do |p|
      c = Cloud9::Cost.create(
          amount: Faker::Address.building_number,
          product_id: p.id,
          active: false
      )

      pr = Cloud9::Price.create(
          amount: c.amount*2,
          product_id: p.id,
          active: true
      )
    end

    Cloud9::Product.take(5).each do |p|
      p.status = "production"
      p.save
    end

    #Build core product offerings

    # Build Customer side of this

    10.times do
      c = Cloud9::Customer.create(
          #  organization_name :string(255)
          organization_name: Faker::Company.name
      )

      #System
      #  virtual_machine_identifier :string(255)
      #  raw_data                   :text
      #  customer_id                :integer

      s = Cloud9::System.create(
        virtual_machine_identifier: Faker::Vehicle.vin,
        customer_id: c.id
      )

      user_list = []
      5.times do
        user_list << Cloud9::User.create(
          admin: false,
          email: Faker::Internet.email
        )
      end

      s.users = user_list
      s.save

    end
  end

end