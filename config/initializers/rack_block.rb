Wildsite::Application.configure do

  config.middleware.insert_before(Rack::Lock, Rack::Block) do  
    # Add your rules with the rack-block syntax in here

		  ip_pattern '83.255.120.15' do
		  # expressions like '192.0.0.' also available
		    halt 404
		  end
		
  end

end

