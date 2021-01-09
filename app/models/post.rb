class Post < ApplicationRecord
  belongs_to :user

  validates :content, length: { in: 0..500 }
end
