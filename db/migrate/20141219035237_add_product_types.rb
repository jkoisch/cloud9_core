class AddProductTypes < ActiveRecord::Migration
  def change

    Cloud9::ProductType.create(
        name: "RAM",
        description: "Random Access Memory for your server"
    )

    Cloud9::ProductType.create(
        name: "Hard Drive Space",
        description: "Hard Drive Space for your server"
    )

  end
end
