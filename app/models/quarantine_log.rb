class QuarantineLog < ApplicationRecord
    belongs_to :user, dependent: :destroy
    has_one :result_logs, dependent: :destroy
end
