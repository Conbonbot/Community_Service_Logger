class Supervisor < ApplicationRecord
    has_many :hours, dependent: :destroy
    validates :first_name, presence: true
    validates :last_name,  presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :address, presence: true
    validates :telephone, presence: true
    validates :role, presence: true
    validates :organization, presence: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    

end
