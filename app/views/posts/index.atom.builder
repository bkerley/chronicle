atom_feed(:schema_date=>"2008-03-20") do |feed|
	feed.title("Bryce Kerley")
	feed.updated((@posts.first.created_at))
	
	feed.generator("Chronicle")
	feed.rights( "All content © 2008 by Bryce Kerley. This work is licensed under a Creative Commons Attribution-Share Alike 3.0 Unported License. Any original source code posted without explicit licensing information is licensed under the WTF Public License without warranty or guarantee that it'll work.")
	feed.author do |author|
		author.name("Bryce Kerley")
		author.uri("http://brycekerley.net/")
		author.email("bkerley@brycekerley.net")
	end
	
	for post in @posts
		feed.entry(post, :url=>single_url(post.slug)) do |entry|
			entry.title(post.title)
			entry.content(render(:partial=>'posts/short.html.erb', :locals=>{:abbreviated=>post}), :type => 'html')
			post.tags.each do |t|
				entry.category(:term=>t.title)
			end
		end
	end
end