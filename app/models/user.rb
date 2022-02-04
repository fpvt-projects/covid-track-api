class User < ApplicationRecord
    belongs_to :account, dependent: :destroy
    has_many :journals, dependent: :destroy
    has_many :quarantineLogs, dependent: :destroy
    has_many :resultLogs, through: :quaratineLogs

    validates :lastname, :firstname, length: {minimum:2}, presence: true

    #Birthdate should no be greater than the date today, Use Date.parse("January 12 2000") to enter data
    validates :birthdate, comparison: {less_than: Date.today}, presence: true

    #Cellnumber should be unique, and only numerical string with length between 11 to 13 chars.
    validates :cellnumber, length: {minimum: 11, maximum: 13}, format:{with: /\A[+-]?\d+\z/ }, presence: true, uniqueness: true

    validates :gender, :address, :city, presence: true


end
