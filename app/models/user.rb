class User < ApplicationRecord
    has_secure_password
    has_many :dives

    validates :email, :username, :password, presence: true
    validates :email, uniqueness: true
  
    def user_serializer
      {
        username: username,
        email: email,
        password: password,
        id: id
      }
    end

end
