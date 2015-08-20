class RenameColumnInTagging < ActiveRecord::Migration
  def up
  	rename_column :taggings, :article_id, :tutorial_id
  end

  def down
  end
end
