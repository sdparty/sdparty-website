class AddInCampaignToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :in_campaign, :boolean
  end
end
