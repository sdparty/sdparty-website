require "rails_helper"

describe "Admin/Banner" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:banner) { FactoryGirl.create(:banner) }
  let(:new_banner) do
    {
      title: "new_banner_title",
      button: "new_banner_button",
      link: "http://www.google.com/",
      image: File.open(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')),
      published: true
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/banners/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/banners/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/banners/#{banner.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/banners", :banner => new_banner
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        banner
        update_data = { :title => "new_title" }
        put "/admin/banners/#{banner.id}", :banner => update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        banner
        expect {
          delete "/admin/banners/#{banner.id}"
        }.to change { Banner.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end
  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/banners/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/banners/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/banners/#{banner.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/banners", :banner => new_banner
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        banner
        update_data = { :title => "new_title" }
        put "/admin/banners/#{banner.id}", :banner => update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        banner
        expect {
          delete "/admin/banners/#{banner.id}"
        }.to change { Banner.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/banners/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/banners/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/banners/#{banner.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/banners", :banner => new_banner
        expect(response).to be_success
      end
    end

    describe "#update" do
      it "success" do
        banner
        update_data = { :title => "new_title" }
        put "/admin/banners/#{banner.id}", :banner => update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "success" do
        banner
        expect {
          delete "/admin/banners/#{banner.id}"
        }.to change { Banner.count }.by(-1)
        expect(response).to be_redirect
      end
    end
  end
end