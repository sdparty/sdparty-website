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

  describe "#program01" do
    it "success" do
      get "/program01"
      expect(response).to be_success
    end
  end

  describe "#program02" do
    it "success" do
      get "/program02"
      expect(response).to be_success
    end
  end

  describe "#program03" do
    it "success" do
      get "/program03"
      expect(response).to be_success
    end
  end

  describe "#policies" do
    it "success" do
      get "/policies"
      expect(response).to be_success
    end
  end

  describe "#policy01" do
    it "success" do
      get "/policy01"
      expect(response).to be_success
    end
  end

  describe "#policy02" do
    it "success" do
      get "/policy02"
      expect(response).to be_success
    end
  end

  describe "#policy03" do
    it "success" do
      get "/policy03"
      expect(response).to be_success
    end
  end

  describe "#policy04" do
    it "success" do
      get "/policy04"
      expect(response).to be_success
    end
  end

  describe "#policy05" do
    it "success" do
      get "/policy05"
      expect(response).to be_success
    end
  end

  describe "#policy06" do
    it "success" do
      get "/policy06"
      expect(response).to be_success
    end
  end
end