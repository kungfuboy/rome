class Post < ApplicationRecord
    validates :title, presence: true, length: { maximum: 10 }, uniqueness: { case_sensitive: false }
end
