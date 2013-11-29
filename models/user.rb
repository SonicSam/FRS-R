class User
    include Mongoid::Document
    
    field :username, type: String
    field :password_hash, type: String
        
    has_many :filters
    has_many :comments
    has_and_belongs_to_many :releases    
end