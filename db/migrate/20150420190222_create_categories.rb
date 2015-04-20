class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.integer :position
      t.string :name
    end
    add_index :categories, :position, :unique => true
  end
end
