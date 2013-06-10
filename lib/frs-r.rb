#!env ruby
require 'rubygems'
require 'bundler/setup'
Bundler.require

class T
    include Mongoid::Document
end

class FRSR < Sinatra::Base

    set :environment, :production

    configure do
        Mongoid.load! 'lib/mongoid.yml', :production
    end
    
    get '/' do
        T.create(
          first_name: "Heinrich",
          last_name: "Heine"
        )
    end
    
    get '/g/' do
        
        p "There are: " << T.count.to_s << " Dogs"
    end
    
end

FRSR.run!