class University < ActiveRecord::Base
  attr_accessible :name, :slug
  has_many :tutorials

   extend FriendlyId
    friendly_id :name, use: :slugged
	
	before_validation :create_slug

  def self.all_universities
	University.all.map(&:name).join(", ")
  end

  def create_slug
	  self.slug = self.name.try(:parameterize) if !self.slug.present?
  end
end
