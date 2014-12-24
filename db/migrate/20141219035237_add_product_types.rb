class AddProductTypes < ActiveRecord::Migration
  def change

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

  end
end
