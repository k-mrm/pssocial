class User < ApplicationRecord
  has_secure_password
  has_many :posts

  validates :screenname, length: { in: 1..100 }
  validates :username, length: { in: 1..20 }, format: { with: /\A[a-zA-z0-9_]+\z/ }
  validates :profile, length: { in: 1..100 }
end
