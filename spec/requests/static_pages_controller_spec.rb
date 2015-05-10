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

  describe "#donate" do
    it "success" do
      FactoryGirl.create :donate_article
      get "/donate"
      expect(response).to be_success
    end
  end

  describe "#join" do
    it "success" do
      get "/join"
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
      get "/programs_1"
      expect(response).to be_success
    end
  end

  describe "#programs_2" do
    it "success" do
      get "/programs_2"
      expect(response).to be_success
    end
  end

  describe "#programs_3" do
    it "success" do
      get "/programs_3"
      expect(response).to be_success
    end
  end

  describe "#policies" do
    it "success" do
      get "/policies"
      expect(response).to be_success
    end
  end

  describe "#policies_1" do
    it "success" do
      get "/policies_1"
      expect(response).to be_success
    end
  end

  describe "#policies_2" do
    it "success" do
      get "/policies_2"
      expect(response).to be_success
    end
  end

  describe "#policies_3" do
    it "success" do
      get "/policies_3"
      expect(response).to be_success
    end
  end

  describe "#policies_4" do
    it "success" do
      get "/policies_4"
      expect(response).to be_success
    end
  end

  describe "#policies_5" do
    it "success" do
      get "/policies_5"
      expect(response).to be_success
    end
  end

  describe "#policies_6" do
    it "success" do
      get "/policies_6"
      expect(response).to be_success
    end
  end
end