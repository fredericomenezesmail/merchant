class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :file
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validate :file
end
