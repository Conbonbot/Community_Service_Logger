class User < ApplicationRecord
    attr_accessor :remember_token
    before_save { email.downcase! }
    validates :first_name, presence: true, length: { maximum: 50}
    validates :last_name, presence: true, length: { maximum: 50}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255}, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    VALID_STUDENT_ID_REGEX = /\A[+-]?\d+\z/ 
    validates :student_id, presence: true, length: { minimum: 6, maximum: 6}, format: { with: VALID_STUDENT_ID_REGEX }, uniqueness: true
    validates :grade, presence: true, :inclusion => 9..12
    has_secure_password
    validates :password, presence: true, length: { minimum: 6}
    validates :signature, presence: true
    # Returns the hash of a given string.
    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    # Returns a random token
    def User.new_token
        SecureRandom.urlsafe_base64
    end
    
     # Remembers a user in the database for use in persistent sessions.
    def remember
     self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    # Returns true if the given token matches the digest.
    def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end
    
    # forgets a user
    def forget
        update_attribute(:remember_token, nil)
    end
end
