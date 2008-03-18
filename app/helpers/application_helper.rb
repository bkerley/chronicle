# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
	def title
		flash[:title]
	end
	
	def editable_content_tag(elemtype, obj, prop, editable, options = {}, editOptions = {}, ajaxOptions = {})
	    objname = obj.class.to_s.downcase
	    options[:url] = "/#{objname.pluralize}/#{obj.id}" unless options.has_key? :url
	    options[:url] += '.json'
	    options[:id] = dom_id(obj)+"_#{prop}" unless options.has_key? :id
	    ajaxOptions[:method] = 'put'
	    edops = jsonify editOptions
	    ajops = jsonify ajaxOptions

	    tg = content_tag  elemtype, 
	                      obj.send(prop),
	                      options = options

	    if editable then
	      tg += "
	           <script type='text/javascript'>\n
	               new Ajax.InPlaceEditor('#{options[:id]}', '#{options[:url]}', { 
	                        ajaxOptions: { #{ajops} },
	                        callback: function(form, value) 
	                          { return 'authenticity_token=#{form_authenticity_token}&#{objname}[#{prop}]=' + escape(value) },
	                        onComplete: function(transport, element) 
	                          { element.innerHTML=transport.responseText.evalJSON().#{prop};}"
	      tg += ",#{edops}" unless edops.empty?
	      tg += "});\n"
	      tg += "         </script>\n"

	    end
	end

	#stupid helper helper to convert a hash into a JSON options list
	# (without the encompasing {}'s or any type of recursion
	#Is there a rails API function that does this? 
	def jsonify hsh
	    str = ''
	    first = true
	    hsh.each do |k,v|
	      str += ', ' unless first
	      str += "#{k}: "
	      str += "'" unless (v.class == Fixnum or v.class == Float)
	      str += v.to_s
	      str += "'" unless (v.class == Fixnum or v.class == Float)
	      first = false
	    end
	    str
	  end
end
