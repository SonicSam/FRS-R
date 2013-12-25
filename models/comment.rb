class Comment
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  field :text, type: String
  
  belongs_to :user
  belongs_to :release
  
end
