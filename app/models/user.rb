class User < ActiveRecord::Base
    has_many :cocktails
    
    has_secure_password
    validates :username, presence: true
end