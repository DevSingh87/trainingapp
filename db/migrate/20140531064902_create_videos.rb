class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.references :tutorial
      t.string :title
      t.string :video_url

      t.timestamps
    end
    add_index :videos, :tutorial_id
  end
end
