class User < ApplicationRecord
  authenticates_with_sorcery!
  attr_accessible :email, :password, :password_confirmation
  validates_confirmation_of :password
  validates_presence_of :password, :on =>:create
  validates_presence_of :email
  Validates_uniqueness_of :email
  
  has_many :cards
end
