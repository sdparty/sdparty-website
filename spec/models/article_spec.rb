require "rails_helper"

describe Article do
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

  it "published work" do
    article1 = FactoryGirl.create(:press_article)
    article2 = FactoryGirl.create(:press_article, published: false)
    article3 = FactoryGirl.create(:press_article, published_at: 1.day.from_now)
    expect(Article.published).to eq([article1])
  end

  it "presses, activities, issues work" do
    article1 = FactoryGirl.create(:press_article, published_at: 1.day.ago)
    article2 = FactoryGirl.create(:press_article, published_at: 2.days.ago)
    article3 = FactoryGirl.create(:activity_article, published_at: 3.days.ago)
    article4 = FactoryGirl.create(:activity_article, published_at: 4.days.ago)
    article5 = FactoryGirl.create(:issue_article, published_at: 5.days.ago)
    article6 = FactoryGirl.create(:issue_article, published_at: 6.days.ago)
    expect(Article.scope_presses).to eq([article1, article2])
    expect(Article.scope_activities).to eq([article3, article4])
    expect(Article.scope_issues).to eq([article5, article6])
  end
end
