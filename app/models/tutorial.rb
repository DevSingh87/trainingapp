class Tutorial < ActiveRecord::Base

  attr_accessible :description, :title, :image_attributes, :videos_attributes, :category_id, :university_id, :subject_id, :tag_list
  
  has_many :taggings, :dependent => :destroy
    has_many :tags, through: :taggings
  belongs_to :category
  belongs_to :university
  belongs_to :subject
  has_one :image, :dependent => :destroy
  
  has_many :videos, :dependent => :destroy
  
  accepts_nested_attributes_for :image,
                                :reject_if => :all_blank,
                                :allow_destroy => true
								
  accepts_nested_attributes_for :videos,
                                :reject_if => :all_blank,
								:allow_destroy => true
								
  validates :title, :presence => true
  validates :slug,  :presence => true, :uniqueness => true
  validates_associated :videos
  

  def self.tagged_with(name)
    Tag.find_by_name!(name).tutorials
  end

  def self.tag_counts
    Tag.select("tags.*, count(taggings.tag_id) as count").
      joins(:taggings).group("taggings.tag_id")
  end
  
  def tag_list
    tags.map(&:name).join(", ")
  end
  
  def tag_list=(names)
    self.tags = names.split(",").map do |n|
      Tag.where(name: n.strip).first_or_create!
    end
  end


  extend FriendlyId
  friendly_id :title, use: :slugged
 
  before_validation :create_slug
  
    
  private

	def create_slug
	  self.slug = self.title.try(:parameterize) if !self.slug.present?
	end
  
  
end
