class Account < ApplicationRecord
    has_secure_password
    has_one :user

    validates :email, :password_digest, presence: true, uniqueness: true
    validates :email, format: {with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid email address"}

    #to get the authorization token fom the payload
    def self.from_token_payload payload 
        self.find payload["sub"]
    end

    #add user details to payload as current_user
    def to_token_payload
        {:sub => self.id, :email => self.email, :user_id => self.user.id, :firstname => self.user.firstname, :lastname => self.user.lastname, :gender => self.user.gender}
    end


end
