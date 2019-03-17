class User < ApplicationRecord
  has_secure_password

  #make the username unique and mandatory
  validates :username, presence: true, uniqueness: true
end
