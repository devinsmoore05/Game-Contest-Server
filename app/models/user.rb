class User < ActiveRecord::Base
	has_secure_password

	validates :username, presence: true, uniqueness: true, length: {maximum: 25}
	validates :email, presence: true, format: /[\w-]+@[a-zA-Z.]+\.[\w]{2,3}/

end
