class User
  include Mongoid::Document
  include Mongoid::Timestamps # adds created_at and updated_at fields

  # field <name>, :type => <type>, :default => <value>
  field :username, :type => String
  field :provider, :type => String
  field :uid, :type => String
  field :email, :type => String
  
  has_many :comments
  has_and_belongs_to_many :releases
  
  attr_protected :provider, :uid, :name, :email
  
  def self.find_or_create_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_omniauth(auth)
  end
  
  def self.create_omniauth(auth)
    User.create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      user.username = auth['info']['nickname']
      user.email = auth['info']['email'] ||= ''
    end
  end
    

  # You can define indexes on documents using the index macro:
  # index :field <, :unique => true>

  # You can create a composite key in mongoid to replace the default id using the key macro:
  # key :field <, :another_field, :one_more ....>
end
