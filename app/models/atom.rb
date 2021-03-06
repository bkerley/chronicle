class Atom < ActiveRecord::Base
	validates_presence_of :url, :name
	validates_uniqueness_of :url, :name
	
	def check_update
		str = Net::HTTP::get(URI::parse(self.url))
		feed = AtomParser::Feed.new(str)

		entry = feed.entries.first
		if self.updated.nil? or entry.updated > self.updated
			p = Post.create(
				:title => entry.title.strip,
				:body =>  entry.content.value,
				:slug =>  entry.title.strip.gsub(/\s/,'_').gsub(/[^\d\w-]/,'')
			)
			puts "Saving #{p.inspect}"
			self.updated = entry.updated
			self.save
			p.save
		end
	end
end
