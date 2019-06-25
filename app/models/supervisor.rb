class Supervisor < ApplicationRecord
    attr_accessor :remember_token, :activation_token, :reset_token
    before_save :downcase_email
    before_create :create_activation_digest
    has_many :hours, dependent: :destroy    
    attr_accessor :remember_token, :activation_token
    validates :first_name, presence: true
    validates :last_name,  presence: true
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
    validates :address, presence: true
    VALID_PHONE_REGEX = /\A[2-9]\d{2}-\d{3}-\d{4}\z/
    validates :telephone, presence: true, format: {with: VALID_PHONE_REGEX}
    validates :role, presence: true
    validates :organization, presence: true
    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }
    VALID_ACCESS_CODE_REGEX = /4231988210/
    validates :access_code, presence: true, format: {with: VALID_ACCESS_CODE_REGEX}
    
    
    # Returns the hash of a given string.
    def Supervisor.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end
    
    # Returns a random token
    def Supervisor.new_token
        SecureRandom.urlsafe_base64
    end
    
    # Returns true if the given token matches the digest.
    def authenticated?(attribute, token) 
       digest = send("#{attribute}_digest")
       return false if digest.nil?
       BCrypt::Password.new(digest).is_password?(token)
    end
    
    # Activates an account
    def activate
        update_attribute(:activated, true)
        update_attribute(:activated_at, Time.zone.now)
    end
    
    def send_activation_email
        SupervisorMailer.account_activation(self).deliver_now
    end
    
    # Sends an email to the supervisor
    def send_supervisor_email(user)
        SupervisorMailer.supervisor_hour(self, user).deliver_now
    end
    
    def create_reset_digest
        self.reset_token = Supervisor.new_token
        update_attribute(:reset_digest, Supervisor.digest(reset_token))
        update_attribute(:reset_sent_at, Time.zone.now)
    end
    
    def send_password_reset_email
        SupervisorMailer.password_reset(self).deliver_now
    end

    def remember
     self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end
    
    def forget
        update_attribute(:remember_token, nil)
    end
    
    def password_reset_expired?
        reset_sent_at < 2.hours.ago
    end
    
    private
    
    # Converts an email to all lower-case
    def downcase_email
        self.email = email.downcase
    end
    
    # Creates and assigns the activation token and digest
    def create_activation_digest
        self.activation_token = User.new_token
        self.activation_digest = User.digest(activation_token)
    end

end
