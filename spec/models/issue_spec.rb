require "rails_helper"

describe Issue do
  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :issue
    }.to change { Issue.count }.by(1)
  end

  it "#set_position" do
    issue1 = FactoryGirl.create(:issue)
    issue2 = FactoryGirl.create(:issue)
    position_diff = issue2.position - issue1.position
    expect(position_diff).to eq(1)
  end
end
