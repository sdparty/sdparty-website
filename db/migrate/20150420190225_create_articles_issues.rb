class CreateArticlesIssues < ActiveRecord::Migration
  def change
    create_table :articles_issues, id: false do |t|
      t.belongs_to :article
      t.belongs_to :issue
    end
    add_index :articles_issues, [:article_id, :issue_id], :unique => true
  end
end
