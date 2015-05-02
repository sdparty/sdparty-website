require "rails_helper"

describe Candidate do
  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :candidate
    }.to change { Candidate.count }.by(1)
  end
end
