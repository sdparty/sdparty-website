class AddJobAndExperienceAndEducationToCandidate < ActiveRecord::Migration[4.2]
  def change
    add_column :candidates, :job,  :text
    add_column :candidates, :education, :text
    add_column :candidates, :experience, :text
  end
end
