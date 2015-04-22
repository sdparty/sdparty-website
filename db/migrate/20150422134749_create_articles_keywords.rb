class CreateArticlesKeywords < ActiveRecord::Migration
  def change
    create_table :articles_keywords, id: false do |t|
      t.belongs_to :article
      t.belongs_to :keyword
    end
    add_index :articles_keywords, [:article_id, :keyword_id], :unique => true
  end
end
