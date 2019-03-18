class User < ApplicationRecord
  has_secure_password
  
  enum :role => [:support, :dev, :admin]

  #make the username unique and mandatory
  validates :username, presence: true, uniqueness: true
end
