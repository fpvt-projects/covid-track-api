class QuarantineLog < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :result_logs, dependent: :destroy
end
