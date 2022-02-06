class QuarantineLog < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :result_log, dependent: :destroy
end
