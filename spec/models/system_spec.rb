require 'rails_helper'

RSpec.describe Cloud9::System, :type => :model do

  it "has a virtual_machine_identifier" do
    sys = build(:system)
    expect(sys.valid?).to eq(true)
    expect(sys.virtual_machine_identifier).to eq("system_1")
  end

  it "has a customer" do
    sys = build(:system)
    expect(sys.customer.organization_name).to eq('Organization')
  end

  it "has basic components instantiated" do
    sys = create(:system)

    ram = Cloud9::Component.find_by(system_id: sys.id, product_id: Cloud9::Product.ram_id)
    cpu = Cloud9::Component.find_by(system_id: sys.id, product_id: Cloud9::Product.cpu_id)
    hd = Cloud9::Component.find_by(system_id: sys.id, product_id: Cloud9::Product.hd_boot_id)

    expect(sys.components.length).to eq(3)
    expect(sys.components.include?(ram)).to eq(true)
    expect(sys.components.include?(cpu)).to eq(true)
    expect(sys.components.include?(hd)).to eq(true)
  end

end