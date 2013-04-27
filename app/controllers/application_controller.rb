class ApplicationController < ActionController::Base
  protect_from_forgery

  def bump_it(stream, ammount)
    stream.rank += ammount
    stream.save
  end

  def write_cook(sym, id)
    
		#method chaining
		cookies[sym]=
		cookies[sym].to_s.split(',').push(id.to_s).join(',')
  end

  def read_cook(sym)
    if cookies[sym]
      cookies[sym].split(",")
    else
      []
    end   
  end
	


  
end
