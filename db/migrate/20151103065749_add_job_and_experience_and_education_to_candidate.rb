class AddJobAndExperienceAndEducationToCandidate < ActiveRecord::Migration
  def change
    add_column :candidates, :job,  :text
    add_column :candidates, :education, :text
    add_column :candidates, :experience, :text
  end
end
