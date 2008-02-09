class Post < ActiveRecord::Base
	has_and_belongs_to_many :tags
	validates_format_of :slug, :with=>/(![.\/:])/
	validates_presence_of :slug, :title
	validates_uniqueness_of :slug, :title
end
