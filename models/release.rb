class Release
    include Mongoid::Document
    
    field :name, type: String
    field :filesize, type: Integer
    field :numfiles, type: Integer
    field :added, type: DateTime
	field :logicallyDeleted, type: Boolean, default: false
    
    has_and_belongs_to_many :user
    has_many :comments  
end