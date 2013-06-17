#!env ruby
require 'rubygems'
require 'bundler/setup'
Bundler.require
require_rel './models'

class FRSR < Sinatra::Base

    set :environment, :production

    configure do
        Mongoid.load! 'lib/mongoid.yml', :production
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

FRSR.run!