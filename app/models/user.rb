class User < ApplicationRecord
  has_secure_password
  has_many :memos

  validates :email, presence: true, uniqueness: true,
            format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  validates :name, presence: true, length:{in: 3..30}
end
