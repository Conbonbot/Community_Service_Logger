class User < ApplicationRecord
    validates :name, presence: true, length:{ maximum: 50 }
    validates :last_name, presence: true, length: { maximum: 50 }
    VALID_INDENT_REGEX = /\A[+-]?\d+\z/
    validates :indent, presence: true, length: { maximum: 6, minimum: 6}, format: { with: VALID_INDENT_REGEX },
                            uniqueness: true
                            has_secure_password
                              validates :password, presence: true, length: { minimum: 6 }
end
