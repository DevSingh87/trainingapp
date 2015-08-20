class TutorialBelongsToSubject < ActiveRecord::Migration
  def change
   add_column :tutorials, :subject_id, :integer
  end
end
