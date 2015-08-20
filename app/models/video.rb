class Video < ActiveRecord::Base
	is_impressionable
    attr_accessible :tutorial_id, :title, :video_url, :all_tags
	
	belongs_to :tutorial

	has_many :taggings, :dependent => :destroy
    has_many :tags, through: :taggings
	
	scope :next, lambda {|id| where("id > ?",id).order("id ASC") }
	scope :previous, lambda {|id| where("id < ?",id).order("id DESC") }
	
	validates :title, :video_url,
	          :presence => true
	
	extend FriendlyId
    friendly_id :title, use: :slugged
	
	before_validation :create_slug
    
    def next
      Video.next(self.id).first
    end

    def previous
      Video.previous(self.id).first
    end

    
	
	private

	def create_slug
	  self.slug = self.title.try(:parameterize) if !self.slug.present?
	end
end
