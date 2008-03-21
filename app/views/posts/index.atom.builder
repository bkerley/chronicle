atom_feed do |feed|
	feed.title("Bryce Kerley")
	feed.updated((@posts.first.created_at))
	
	feed.generator("Chronicle")
	
	feed.author do |author|
		author.name("Bryce Kerley")
		author.uri("http://brycekerley.net/")
		author.email("bkerley@brycekerley.net")
	end
	
	for post in @posts
		feed.entry(post, :url=>single_url(post.slug)) do |entry|
			entry.title(post.title)
			entry.content(markdown(post.entire), :type => 'html')
		end
	end
end