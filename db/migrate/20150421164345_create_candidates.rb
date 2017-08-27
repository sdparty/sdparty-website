class CreateCandidates < ActiveRecord::Migration[4.2]
  def change
    create_table :candidates do |t|
      t.string :name
      t.text :description
      t.string :constituency
      t.string :avatar
      t.string :image
      t.string :help_image
      t.string :fb_link
      t.string :help_link
      t.boolean :published, default: false
    end
  end
end
