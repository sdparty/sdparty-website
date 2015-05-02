require "rails_helper"

describe Banner do
  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :banner
    }.to change { Banner.count }.by(1)
  end
end
