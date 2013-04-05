module StreamsHelper

	def feed_me(stream, item)
		
		@stream = stream
		i = item
		 
	  @title = i.at_css(@stream.title).text unless @stream.title.empty? || i.at_css(@stream.title).nil?  
	  @by_line = i.at_css(@stream.by_line).text unless @stream.by_line.empty? || i.at_css(@stream.by_line).nil?  
	  @body = i.at_css(@stream.body).text unless @stream.body.empty? || i.at_css(@stream.body).nil?  
	  @picture = i.css(@stream.picture).map { |link| link['src'] }.first unless @stream.picture.empty? || i.css(@stream.picture).nil? 
	  @item_link = i.css(@stream.item_link).map { |link| link['href'] }.first unless @stream.item_link.empty? || i.at_css(@stream.item_link).nil? 

		@bad_list = Array.new
	  @bad_list << "Read the rest of this entry"

	  if @body 
	    @bad_list.each do |b| 
	      if @body.include? b  
	        @body.slice! b 
	      end 
	    end 
	  end

	end

end
