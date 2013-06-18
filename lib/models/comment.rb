class Comment
    include Mongoid::Document
    
    belongs_to :user
    belongs_to :release
    
    field :text, type: String
    
end