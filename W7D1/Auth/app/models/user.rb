class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true
    validates :password, presence: true, length: { minimum: 6 }, allow_nil: true, message: { "Password can't be blank, duuh!" }
    before_validation :ensure_session_token
    
end
