class User < ApplicationRecord
  has_secure_password
  has_many :posts

  # see: https://railsguides.jp/active_record_validations.html
  validates :screenname, length: { in: 1..100 }
  validates :username, length: { in: 1..20 }, format: { with: /\A[a-zA-z0-9_]+\z/ }
  validates :profile, length: { maximum: 100 }
end
