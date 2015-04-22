class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.string :name
      t.integer :position
    end
    add_index :issues, :position, :unique => true
  end
end
