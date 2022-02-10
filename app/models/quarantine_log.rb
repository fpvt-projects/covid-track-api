class QuarantineLog < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :result_log, dependent: :destroy

    scope :same_user, -> { where(user_id: user_id)}
    scope :same_day, -> { where(date: Date.today)}
    scope :last_start, -> { where(status: "Start")}
end
