class User < ActiveRecord::Base
    has_many :answer_lists
    validates :username, :email, presence: true 
    has_secure_password
end