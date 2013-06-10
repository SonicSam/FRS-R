#!env ruby
require 'rubygems'
require 'bundler/setup'
Bundler.require

class FRSR < Sinatra::Base
    
    #configure do
    #    MongoMapper.setup({'production' => {'uri' => ENV['MONGODB_URI']}}, 'production')
    #end
    
    get '/' do
        "Hello World"
    end
    
end

FRSR.run!