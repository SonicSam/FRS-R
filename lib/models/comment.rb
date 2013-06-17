class Comment
    include Mongoid::Document
    
    belongs_to :user
    
    #etc...
end