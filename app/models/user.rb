class User < ActiveRecord::Base
	has_secure_password

  has_many :referees #Says our user can have many referees.
  has_many :contests
  has_many :players
  
	validates :username, presence: true, uniqueness: true, length: {maximum: 25}
	validates :email, presence: true, format: /[\w-]+@[a-zA-Z.]+\.[\w]{2,3}/

end