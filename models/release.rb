class Release
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :name, type: String
  field :filesize, type: Integer
  field :numfiles, type: Integer
  
  has_and_belongs_to_many :users
  has_many :comments
end
