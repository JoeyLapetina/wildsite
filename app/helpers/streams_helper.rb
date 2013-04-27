module StreamsHelper

	def feed_me(stream, item)

		@title = nil
    @replies = nil
    @views = nil
    @item_link = nil
    @by_line = nil
    @body = nil
    @picture = nil
		
		@stream = stream
		
		i = item
		 
	  @title = i.at_css(@stream.title).text unless @stream.title.empty? || i.at_css(@stream.title).nil? 
	  @by_line = i.at_css(@stream.by_line).text unless @stream.by_line.empty? || i.at_css(@stream.by_line).nil?  
	  @body = i.at_css(@stream.body).text unless @stream.body.empty? || i.at_css(@stream.body).nil?  
	  @picture = i.css(@stream.picture).map { |link| link['src'] }.first unless @stream.picture.empty? || i.css(@stream.picture).nil? 
	  @item_link = i.css(@stream.item_link).map { |link| link['href'] }.first unless @stream.item_link.empty? || i.at_css(@stream.item_link).nil? 

	  #forum info
	  if @stream.stream_type == "forum" || @stream.stream_type == "reddit"
		  @replies = i.at_css(@stream.replies).text unless @stream.replies.empty? || i.at_css(@stream.replies).nil?
		  @views = i.at_css(@stream.views).text unless @stream.views.empty? || i.at_css(@stream.views).nil?

		  if @stream.stream_type == "reddit"
		  	if @body == "(self.WildStar)"
			  	@item_link = "#{@stream.site_root}#{@item_link}"
			  end
		  end
		end


		@bad_body_list = Array.new
	  @bad_body_list << "Read the rest of this entry"

	 	@bad_view_list = Array.new
	  @bad_view_list << "views" "Views"
	  @bad_view_list << "Views"  

	  @bad_replies_list = Array.new
	  @bad_replies_list << "replies" 
	  @bad_replies_list << "Posts:"

	  if @body 
	    @bad_body_list.each do |b| 
	      if @body.include? b  
	        @body.slice! b 
	      end 
	    end 
	  end

	  if @views 
	    @bad_view_list.each do |b| 
	      if @views.include? b  
	        @views.slice! b 
	      end 
	    end 
	  end

	  if @replies 
	    @bad_replies_list.each do |b| 
	      if @replies.include? b  
	        @replies.slice! b 
	      end 
	    end 
	  end
	end
end


