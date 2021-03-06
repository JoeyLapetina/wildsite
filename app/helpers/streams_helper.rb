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
		 
		if @stream.stream_type == "rss_stream"
			@title = i.xpath(@stream.title).inner_text unless @stream.title.empty? || i.xpath(@stream.title).inner_text.nil?  
		  @body = i.xpath(@stream.body).inner_text.html_safe unless @stream.body.empty? || i.xpath(@stream.body).inner_text.nil?   
		  @item_link = i.xpath(@stream.item_link).inner_text unless @stream.item_link.empty? || i.xpath(@stream.item_link).inner_text.nil?
		  @picture = Nokogiri::HTML(item.xpath(@stream.picture).inner_html).search('img').first.attributes['src'].value unless @stream.picture.empty? || i.xpath(@stream.picture).inner_text.nil?
		else
		  @title = i.at_css(@stream.title).text unless @stream.title.empty? || i.at_css(@stream.title).nil? 
		  @by_line = i.at_css(@stream.by_line).text unless @stream.by_line.empty? || i.at_css(@stream.by_line).nil?  
		  @body = i.at_css(@stream.body).text unless @stream.body.empty? || i.at_css(@stream.body).nil?  
		  @picture = i.css(@stream.picture).map { |link| link['src'] }.first unless @stream.picture.empty? || i.css(@stream.picture).nil? 
		  @item_link = i.css(@stream.item_link).map { |link| link['href'] }.first unless @stream.item_link.empty? || i.at_css(@stream.item_link).nil? 
		end
	  
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

	  #check to  see if stream item exists
		if @stream.track
			unless @item_link.nil? || StreamItem.where(item_link: @item_link).present?
				#make the items?
				stream_item = StreamItem.new(stream_id: @stream.id, title: @title, item_link: @item_link)

		    stream_item.replies = @replies if @replies
		    stream_item.views = @views if @views 
		    stream_item.by_line = @by_line if @by_line
		    stream_item.body = @body if @body
		    stream_item.picture = @picture if @picture
		    stream_item.save

		    if @stream.is_ready
		    	alert = ['ALERT', "BLOOP", "BEEP", "CLUNK", "SCRAPE", "ZING", "ZAAM"]
		    	mew = [": New", ": Fresh", " ALERT:", " BLOOP:", " BEEP:", " CLUNK:", " SCRAPE:", " ZING:", " ZAAM:"]
		    	data = ["data", "info", "news", "update"]
		    	receved = ["receved", "procured", "obtained", "scraped", "found", "scavenged"]
		    	i = rand(2)+1
		    	if i == 1 
			    	Twitter.update("#{alert[rand(alert.length)]}#{mew[rand(mew.length)]} ##{@game.capitalize} #{data[rand(data.length)]} #{receved[rand(receved.length)]} from #{@stream.name} - WildScrape.com/s/#{@stream.id}")
			  	elsif i == 2
			    	Twitter.update("#{@stream.name} ##{@game.capitalize} #{data[rand(data.length)]} #{receved[rand(receved.length)]} -#{alert[rand(alert.length)]}#{mew[rand(mew.length)]}- WildScrape.com/s/#{@stream.id}")
			  	end
			  end
			end
		end

	end
end



