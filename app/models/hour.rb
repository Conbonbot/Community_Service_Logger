class Hour < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  VALID_CONTENT_REGEX = /\A[+-]?\d+\z/ # try later
  validates :content, presence: true, :inclusion => 1..100
end
