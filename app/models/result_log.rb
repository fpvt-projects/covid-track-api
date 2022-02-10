class ResultLog < ApplicationRecord
    has_one :quarantine_log

    validates :brand, :result, :antigen_type, length: {minimum: 2}, presence: true
    validates :user_id, presence:true
   

    after_create :will_quarantine

    #If user is positive and has no postive entry the past 7 days,
    #Quarantine status will be flagged as "Start" and the Date is the last day of quarantine
    #if user is currently under going quarantine, the new qlog status would be Ongoing, regardless of result of test
    #if user is not under going quaratine and has negative result, the quarantinelog status will be "Random"


    def will_quarantine
        check_entry = QuarantineLog.last_start.find_by(user_id: user_id)

        if check_entry == nil && result == "Positive"
            QuarantineLog.create(
                status: "Start",
                date: (Date.today + 7.days),
                user_id: user_id,
                result_log_id: id
            )
        elsif check_entry.present? && check_entry.date == Date.today 
            QuarantineLog.create(
                status: "Ended", 
                date: Date.today,
                user_id: user_id,
                result_log_id: id
            )
        else
            QuarantineLog.create(
                status: "#{check_entry.present? && check_entry.date > Date.today ? "Ongoing" : "Random Testing"}", 
                date: Date.today,
                user_id: user_id,
                result_log_id: id
            )
        end
    end
end
