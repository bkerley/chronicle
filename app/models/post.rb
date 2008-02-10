class Post < ActiveRecord::Base
	has_and_belongs_to_many :tags
	validates_format_of :slug, :with=>/^([\d\w-])*$/
	validates_presence_of :slug, :title
	validates_uniqueness_of :slug, :title
	
	def tag_string=(tag_string)
		individual_tags = tag_string.split " "
		tag_models = individual_tags.map do |t|
			Tag.find_or_create_by_title t
		end
		self.tags = tag_models
	end
	
	def tag_string
		self.tags.map(&:title).join(" ")
	end
end
