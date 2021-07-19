class User < ApplicationRecord
    has_secure_password
    has_many :dives

    validates :email, :username, presence: true
    validates :email, uniqueness: true
  
    def user_serializer
      {
        username: username,
        email: email,
        id: id
      }
    end

end
