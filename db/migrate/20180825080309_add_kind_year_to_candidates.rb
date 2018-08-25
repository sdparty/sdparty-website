class AddKindYearToCandidates < ActiveRecord::Migration[5.1]
  def change
    add_column :candidates, :kind, :string
    add_column :candidates, :year, :integer
  end
end
