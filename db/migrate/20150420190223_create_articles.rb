class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :kind
      t.belongs_to :user
      t.boolean :published, default: false
      t.datetime :published_at
      t.string :image
      t.string :title
      t.text :content
      t.string :youtube_url
      t.string :youtube_id

      t.timestamps null: false
    end
  end
end
