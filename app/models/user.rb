class User < ApplicationRecord
    before_save { email.downcase! }
    validates :first_name, presence: true, length: { maximum: 50}
    validates :last_name, presence: true, length: { maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    VALID_STUDENT_ID_REGEX = /\A[+-]?\d+\z/ 
    validates :student_id, presence: true, length: { minimum: 6, maximum: 6}, format: { with: VALID_STUDENT_ID_REGEX }, uniqueness: true
    validates :grade, presence: true, :inclusion => 9..12
end
