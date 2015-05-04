class CreateBanners < ActiveRecord::Migration
  def change
    create_table :banners do |t|
      t.integer :position
      t.string :image
      t.string :title
      t.string :button
      t.string :link
      t.boolean :published
    end
  end
end
