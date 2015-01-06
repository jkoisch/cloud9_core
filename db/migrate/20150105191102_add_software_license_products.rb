class AddSoftwareLicenseProducts < ActiveRecord::Migration
  def change

    p1 = Cloud9::Product.create(
        name: "2013 MS Word",
        description: "Word",
        product_type_id: 8,
        active: true,
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 700
    )

    p1 = Cloud9::Product.create(
        name: "2013 MS Excel",
        description: "Excel",
        product_type_id: 8,
        active: true,
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 700
    )

    p1 = Cloud9::Product.create(
        name: "2013 Office Standard",
        description: "Excel, Word, PowerPoint, OneNote, Outlook, and Publisher",
        product_type_id: 8,
        active: true,
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 1400
    )

    p1 = Cloud9::Product.create(
        name: "2013 MS Office Professional",
        description: "Excel, Word, PowerPoint, OneNote, Outlook, Publisher, Access, Infopath, & Lync",
        product_type_id: 8,
        active: true,
    )

    Cloud9::Price.create(
        product_id: p1.id,
        active: true,
        amount: 1600
    )



  end
end
