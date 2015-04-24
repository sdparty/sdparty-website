class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :position
      t.string :name
      t.text :content
    end
    add_index :issues, :position, :unique => true
  end
end
