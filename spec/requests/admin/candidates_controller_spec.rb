require "rails_helper"

describe "Admin/Candidate" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:candidate) { FactoryGirl.create(:candidate) }
  let(:new_candidate) do
    {
      name: "new_candidate_name",
      constituency: "new_candidate_constituency",
      experience: "new_candidate_experience",
      education: "new_candidate_education",
      kind: "legislator",
      image: File.open(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')),
      avatar: File.open(File.join(Rails.root, 'spec', 'fixtures', 'test.jpg')),
      published: true,
      year: 2016,
      fb_link: "http://www.google.com/",
      help_link: "http://www.google.com/"
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/candidates/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/candidates/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/candidates/#{candidate.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/candidates", params: { candidate: new_candidate }
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        candidate
        update_data = { name: "new_name" }
        put "/admin/candidates/#{candidate.id}", params: { candidate: update_data }
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        candidate
        expect {
          delete "/admin/candidates/#{candidate.id}"
        }.to change { Candidate.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end
  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/candidates/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/candidates/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/candidates/#{candidate.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/candidates", params: { candidate: new_candidate }
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        candidate
        update_data = { name: "new_name" }
        put "/admin/candidates/#{candidate.id}", params: { candidate: update_data }
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        candidate
        expect {
          delete "/admin/candidates/#{candidate.id}"
        }.to change { Candidate.count }.by(0)
        expect(response).to be_redirect
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/candidates/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/candidates/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/candidates/#{candidate.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/candidates", params: { candidate: new_candidate }
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "success" do
        candidate
        update_data = { name: "new_name" }
        put "/admin/candidates/#{candidate.id}", params: { candidate: update_data }
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "success" do
        candidate
        expect {
          delete "/admin/candidates/#{candidate.id}"
        }.to change { Candidate.count }.by(-1)
        expect(response).to be_redirect
      end
    end
  end
end