class AddPolicyLinkToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :policy_link, :string
  end
end
