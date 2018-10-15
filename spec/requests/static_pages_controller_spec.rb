require "rails_helper"

describe "Static pages" do

  describe "#home" do
    it "success" do
      2.times { FactoryGirl.create :banner }
      2.times { FactoryGirl.create :candidate }
      get "/"
      expect(response).to be_success
    end
  end

  describe "#about" do
    it "success" do
      get "/about"
      expect(response).to be_success
    end
  end

  describe "#donate_one" do
    it "success" do
      FactoryGirl.create :donate_article
      get "/donate_one"
      expect(response).to be_success
    end
  end

  describe "#donate_plan" do
    it "success" do
      FactoryGirl.create :donate_article
      get "/donate_plan"
      expect(response).to be_success
    end
  end

  describe "#fundraising" do
    it "success" do
      FactoryGirl.create :fundraising_article
      get "/fundraising"
      expect(response).to be_success
    end

    it "success with no article" do
      get "/fundraising"
      expect(response).to be_success
    end
  end

  describe "#join" do
    it "success" do
      get "/join"
      expect(response).to be_success
    end
  end

  describe "#party_vote" do
    it "success" do
      get "/party_vote"
      expect(response).to be_success
    end
  end

  describe "#fundraising" do
    it "success" do
      get "/fundraising"
      expect(response).to be_success
    end
  end

  describe "#constructing" do
    it "success" do
      get "/constructing"
      expect(response).to be_success
    end
  end

  describe "#programs" do
    it "success" do
      get "/programs"
      expect(response).to be_success
    end
  end

  describe "#programs_1" do
    it "success" do
      get "/programs/1"
      expect(response).to be_success
    end
  end

  describe "#programs_2" do
    it "success" do
      get "/programs/2"
      expect(response).to be_success
    end
  end

  describe "#programs_3" do
    it "success" do
      get "/programs/3"
      expect(response).to be_success
    end
  end

  describe "#policies" do
    it "success" do
      get "/policies"
      expect(response).to be_success
    end
  end

  describe "#policies_2016" do
    it "success" do
      get "/policies/2016"
      expect(response).to be_success
    end
  end

  describe "#policies_2016_1" do
    it "success" do
      get "/policies/2016/1"
      expect(response).to be_success
    end
  end

  describe "#policies_2016_2" do
    it "success" do
      get "/policies/2016/2"
      expect(response).to be_success
    end
  end

  describe "#policies_2016_3" do
    it "success" do
      get "/policies/2016/3"
      expect(response).to be_success
    end
  end

  describe "#policies_2016_4" do
    it "success" do
      get "/policies/2016/4"
      expect(response).to be_success
    end
  end

  describe "#policies_2016_5" do
    it "success" do
      get "/policies/2016/5"
      expect(response).to be_success
    end
  end

  describe "#policies_2016_6" do
    it "success" do
      get "/policies/2016/6"
      expect(response).to be_success
    end
  end

  describe "#sitemap" do
    it "success" do
      2.times { FactoryGirl.create :press_article }
      2.times { FactoryGirl.create :activity_article }
      2.times { FactoryGirl.create :issue_article }
      get "/sitemap.xml"
      expect(response).to be_success
    end
  end
end