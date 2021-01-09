class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :active_relations, class_name: 'Follow', foreign_key: 'user_id', dependent: :destroy
  has_many :passive_relations, class_name: 'Follow', foreign_key: 'target_user_id', dependent: :destroy
  has_many :followings, through: :active_relations, source: 'user'
  has_many :followers, through: :passive_relations, source: 'target_user'

  # see: https://railsguides.jp/active_record_validations.html
  validates :screenname, length: { in: 1..100 }
  validates :username, length: { in: 1..20 }, format: { with: /\A[a-zA-z0-9_]+\z/ }
  validates :profile, length: { maximum: 100 }

  def follow(target)
    if !following? target
      active_relations.create(target_user_id: target.id)
    end
  end

  def unfollow(target)
    if following? target
      active_relations.find_by(target_user_id: target.id).destroy
    end
  end

  def following?(target)
    followings.include? target
  end

  def follower?(target)
    followers.include? target
  end
end
