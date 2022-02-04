class ResultLog < ApplicationRecord
    belongs_to :quarantine_logs, dependent: :destroy
end
