class Hour < ApplicationRecord
  belongs_to :user
  belongs_to :supervisor
  attr_accessor :supervisor
  accepts_nested_attributes_for :supervisor 
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, :inclusion => 1..100
  validates :approved, presence: true, allow_nil: true
end