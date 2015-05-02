require "rails_helper"

describe Article do
  it "#factory_creat_success" do
    expect {
      FactoryGirl.create :article
    }.to change { Article.count }.by(1)
  end

it "#factory_creat_press_success" do
    expect {
      FactoryGirl.create :press_article
    }.to change { Article.count }.by(1)
  end

it "#factory_creat_activity_success" do
    expect {
      FactoryGirl.create :activity_article
    }.to change { Article.count }.by(1)
  end

it "#factory_creat_issue_success" do
    expect {
      FactoryGirl.create :issue_article
    }.to change { Article.count }.by(1)
  end
end
