#!env ruby
require 'rubygems'

require 'bundler/setup'
Bundler.require

require_rel './models'

class FRSR < Sinatra::Base

    configure do
        Mongoid.load! 'config/mongoid.yml', :production
    end
    
    get '/' do
        User.create(
          username: "Heinrich",
          password_hash: "Heine"
        )
    end
    
    get '/test/' do
        "There are: " << User.count.to_s << " Users"
    end
    
end