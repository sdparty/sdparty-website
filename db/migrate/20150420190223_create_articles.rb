class CreateArticles < ActiveRecord::Migration[4.2]
  def change
    create_table :articles do |t|
      t.string :kind
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
