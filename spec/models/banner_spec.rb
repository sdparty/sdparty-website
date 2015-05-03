require "rails_helper"

describe Banner do
  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :banner
    }.to change { Banner.count }.by(1)
  end

  it "#set_position" do
    banner1 = FactoryGirl.create(:banner)
    banner2 = FactoryGirl.create(:banner)
    position_diff = banner2.position - banner1.position
    expect(position_diff).to eq(1)
  end
end
