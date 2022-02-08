class User < ApplicationRecord
    belongs_to :account
    has_many :journals
    has_many :quarantine_logs
    has_many :result_logs, through: :quarantine_logs

    validates :lastname, :firstname, length: {minimum:2}, presence: true

    #Birthdate should no be greater than the date today, Use Date.parse("January 12 2000") to enter data
    validates :birthdate, comparison: {less_than: Date.today}, presence: true

    #Cellnumber should be unique, and only numerical string with length between 11 to 13 chars.
    validates :cellnumber, length: {minimum: 11, maximum: 13}, format:{with: /\A[+-]?\d+\z/ }, presence: true, uniqueness: true

    validates :gender, :address, :city, presence: true

    #before saving convert the date user input to datetime
    before_save :parse_birthdate

    private

    def parse_birthdate
        self.birthdate.to_datetime
    end

end
