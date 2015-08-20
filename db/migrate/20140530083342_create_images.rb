class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :tutorial
      t.string :image

      t.timestamps
    end
    add_index :images, :tutorial_id
  end
end
