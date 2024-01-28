class User < ApplicationRecord
    validates :username, presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }

    PASSWORD_REGEX = /(?=.+[a-zA-Z0-9])(?=\S+)/
    validates :password, presence: true, length: { minimum: 8, maximum: 25 }, format: { with: PASSWORD_REGEX }

    has_secure_password
end
