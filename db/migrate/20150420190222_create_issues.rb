class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :position
      t.string :name
      t.text :content
    end
  end
end
