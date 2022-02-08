class Account < ApplicationRecord
    has_secure_password
    has_one :user

    validates :email, :password_digest, presence: true, uniqueness: true
    validates :email, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}

    # def to_token_payload
    #     {:id => self.id, :email => self.email, :user_id => self.user.id}
    # end

    # def self.from_token_payload(payload)
    #     self.find payload["sub"]
    # end
end
