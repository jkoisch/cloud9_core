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
        active: true
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
      p c
    end

  end

end