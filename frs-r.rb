#!env ruby
require 'rubygems'

require 'bundler/setup'
Bundler.require

require_rel './models'

class FRSR < Sinatra::Base
	helpers Sinatra::ContentFor
	register Sinatra::Reloader

    configure do
        Mongoid.load! 'config/mongoid.yml', :production
    end
    
    get '/' do
		haml :testLayoutPopulate
    end
	
	get '/reloaderTest/' do
		"reloader test"
	end
    
    get '/test/' do
        "There are: " << User.count.to_s << " Users"
    end
    
end