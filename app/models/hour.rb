class Hour < ApplicationRecord
  belongs_to :user
  belongs_to :supervisor
  attr_accessor :supervisor
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  accepts_nested_attributes_for :supervisor 
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, :inclusion => 1..1000
  validates :email, :length => { maximum: 255}, :format => { with: VALID_EMAIL_REGEX }
  validates :approved, presence: true, allow_nil: true
  validates :organization, presence: true
  
  def approve_hour
    update_attribute(:approved, true)
  end
  
  def deny_hour
    update_attribute(:approved, false)
  end
  
  private
  
  def downcase_email
      self.email = email.downcase
  end
end