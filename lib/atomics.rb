# http://persistent.info/twitter-digest/generate?usernames=BonzoESC&output=atom
require 'rubygems'
require 'atom'
require 'net/http'
require 'uri'

str = Net::HTTP::get(URI::parse('http://persistent.info/twitter-digest/generate?usernames=BonzoESC&output=atom'))
feed = Atom::Feed.new(str)

entry = feed.entries.first
puts entry.title.strip
puts entry.content.value
