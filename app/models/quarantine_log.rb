class QuarantineLog < ApplicationRecord
    belongs_to :user, dependent: :destroy
    belongs_to :result_log, dependent: :destroy

    scope :same_user, -> { where(user_id: user_id)}
    scope :same_day, -> { where(date: Date.today)}
    scope :last_start, -> { where(status: "Start")}
    scope :ended, -> { where(status: "Ended")}
    scope :ongoing, -> { where(status: "Ongoing" && "Start")}

    #filter all entries made today
    #Date.today is usually Date +0000hours
    scope :entries_today, -> { where("created_at > ?", Date.today)}


    after_create :update_case_counter

    #updates CaseCounter, every creation of quarantineLog
    def update_case_counter 
        counter = CaseCount.first 
        today_entries = QuarantineLog.entries_today
        counter.update(
           total_cases: QuarantineLog.last_start.count,
           total_recoveries: QuarantineLog.ended.count,
           active_cases: today_entries.ongoing.count,
           daily_new: today_entries.last_start.count,
           daily_recovered: today_entries.ended.count
        )
        if counter.save == false
            p counter.errors.full_messages
        end
    end

end
