class Account < ApplicationRecord
    has_secure_password

    validates :email, :password_digest, presence: true, uniqueness: true
    validates :email, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}

end
