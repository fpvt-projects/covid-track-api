class ResultLog < ApplicationRecord
    has_one :quarantine_log

    validates :brand, :result, :antigen_type, length: {minimum: 2}, presence: true
end
