class Tagging < ActiveRecord::Base
  attr_accessible :article_id, :tag_id
  belongs_to :tutorial
  belongs_to :tag
end
