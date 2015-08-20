class TutorialBelongsToUniversity < ActiveRecord::Migration
  def change
   add_column :tutorials, :university_id, :integer
  end
end
