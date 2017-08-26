class AddImageAndDonateToCandidates < ActiveRecord::Migration[4.2]
  def change
    add_column :candidates, :donate_form,  :text
    add_column :candidates, :donate_image, :string
  end
end
