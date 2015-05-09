require "rails_helper"

describe "Admin/Issue" do

  let(:user) { FactoryGirl.create(:user) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:issue) { FactoryGirl.create(:issue) }
  let(:new_issue) do
    {
      name: "new_issue_name"
    }
  end

  describe "before login" do
    describe "#index" do
      it "redirect" do
        get "/admin/issues/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/issues/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/issues/#{issue.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/issues", :issue => new_issue
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        issue
        update_data = { :name => "new_name" }
        put "/admin/issues/#{issue.id}", :issue => update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        issue
        expect {
          delete "/admin/issues/#{issue.id}"
        }.to change { Issue.count }.by(0)
        expect(response).to be_redirect
      end
    end

    describe "#sort" do
      it "failed" do
        issue1 = FactoryGirl.create(:issue)
        issue2 = FactoryGirl.create(:issue)
        sort_data = {
          issue: {
            order: {
              '0': {
                id: issue1.id,
                position: 2
              },
              '1': {
                id: issue2.id,
                position: 1
              }
            }
          }
        }
        put "/admin/issues/sort", sort_data
        issue1.reload
        issue2.reload
        expect(Issue.all).to eq([issue1, issue2])
      end
    end
  end

  describe "after login" do
    before { sign_in(user) }
    after { sign_out }

    describe "#index" do
      it "redirect" do
        get "/admin/issues/"
        expect(response).to be_redirect
      end
    end

    describe "#new" do
      it "redirect" do
        get "/admin/issues/new"
        expect(response).to be_redirect
      end
    end

    describe "#edit" do
      it "redirect" do
        get "/admin/issues/#{issue.id}/edit"
        expect(response).to be_redirect
      end
    end

    describe "#create" do
      it "redirect" do
        post "/admin/issues", :issue => new_issue
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "redirect" do
        issue
        update_data = { :name => "new_name" }
        put "/admin/issues/#{issue.id}", :issue => update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "redirect" do
        issue
        expect {
          delete "/admin/issues/#{issue.id}"
        }.to change { Issue.count }.by(0)
        expect(response).to be_redirect
      end
    end

    describe "#sort" do
      it "failed" do
        issue1 = FactoryGirl.create(:issue)
        issue2 = FactoryGirl.create(:issue)
        sort_data = {
          issue: {
            order: {
              '0': {
                id: issue1.id,
                position: 2
              },
              '1': {
                id: issue2.id,
                position: 1
              }
            }
          }
        }
        put "/admin/issues/sort", sort_data
        issue1.reload
        issue2.reload
        expect(Issue.all).to eq([issue1, issue2])
      end
    end
  end

  describe "after login admin" do
    before { sign_in(admin) }
    after { sign_out }

    describe "#index" do
      it "success" do
        get "/admin/issues/"
        expect(response).to be_success
      end
    end

    describe "#new" do
      it "success" do
        get "/admin/issues/new"
        expect(response).to be_success
      end
    end

    describe "#edit" do
      it "success" do
        get "/admin/issues/#{issue.id}/edit"
        expect(response).to be_success
      end
    end

    describe "#create" do
      it "success" do
        post "/admin/issues", :issue => new_issue
        expect(response).to be_redirect
      end
    end

    describe "#update" do
      it "success" do
        issue
        update_data = { :name => "new_name" }
        put "/admin/issues/#{issue.id}", :issue => update_data
        expect(response).to be_redirect
      end
    end

    describe "#destroy" do
      it "success" do
        issue
        expect {
          delete "/admin/issues/#{issue.id}"
        }.to change { Issue.count }.by(-1)
        expect(response).to be_redirect
      end
    end

    describe "#sort" do
      it "success" do
        issue1 = FactoryGirl.create(:issue)
        issue2 = FactoryGirl.create(:issue)
        sort_data = {
          issue: {
            order: {
              '0': {
                id: issue1.id,
                position: 2
              },
              '1': {
                id: issue2.id,
                position: 1
              }
            }
          }
        }
        put "/admin/issues/sort", sort_data
        issue1.reload
        issue2.reload
        expect(Issue.all).to eq([issue2, issue1])
      end
    end
  end
end