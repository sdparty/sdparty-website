class AddImageAndDonateToCandidates < ActiveRecord::Migration
  def change
    add_column :candidates, :donate_form,  :text
    add_column :candidates, :donate_image, :string
  end
end
