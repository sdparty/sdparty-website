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
      image: File.open(File.join(Rails.root, 'spec', 'fixtures', 'banner.jpg')),
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

    describe "#sort" do
      it "failed" do
        banner1 = FactoryGirl.create(:banner)
        banner2 = FactoryGirl.create(:banner)
        sort_data = {
          banner: {
            order: {
              '0': {
                id: banner1.id,
                position: 2
              },
              '1': {
                id: banner2.id,
                position: 1
              }
            }
          }
        }
        put "/admin/banners/sort", sort_data
        banner1.reload
        banner2.reload
        expect(Banner.all).to eq([banner1, banner2])
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

    describe "#sort" do
      it "failed" do
        banner1 = FactoryGirl.create(:banner)
        banner2 = FactoryGirl.create(:banner)
        sort_data = {
          banner: {
            order: {
              '0': {
                id: banner1.id,
                position: 2
              },
              '1': {
                id: banner2.id,
                position: 1
              }
            }
          }
        }
        put "/admin/banners/sort", sort_data
        banner1.reload
        banner2.reload
        expect(Banner.all).to eq([banner1, banner2])
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
        banner.reload
        expect(banner.title).to match(update_data[:title])
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


    describe "#sort" do
      it "success" do
        banner1 = FactoryGirl.create(:banner)
        banner2 = FactoryGirl.create(:banner)
        sort_data = {
          banner: {
            order: {
              '0': {
                id: banner1.id,
                position: 2
              },
              '1': {
                id: banner2.id,
                position: 1
              }
            }
          }
        }
        put "/admin/banners/sort", sort_data
        banner1.reload
        banner2.reload
        expect(Banner.all).to eq([banner2, banner1])
      end
    end
  end
end