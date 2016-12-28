class User < ApplicationRecord
  authenticates_with_sorcery!
  #attr_accessible :email, :password, :password_confirmation
  validates_confirmation_of :password
  #validates_presence_of :password, :on =>:create
  #validates_presence_of :email
  #validates_uniqueness_of :email
  
  has_many :cards

  def self.sign_in_from_omniauth(auth)
    find_by(provider: auth['provider'], uid: auth['uid']) || create_user_from_omniauth(auth)
  end 

  def self.create_user_from_omniauth(auth)
    create(
      provider: auth['provider'],
      uid: auth['uid'],
      name: auth['info']['name']
    )
    
  end
end
