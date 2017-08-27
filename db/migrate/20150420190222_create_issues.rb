class CreateIssues < ActiveRecord::Migration[4.2]
  def change
    create_table :issues do |t|
      t.integer :position
      t.string :name
      t.text :content
    end
  end
end
