class ResultLog < ApplicationRecord
    has_one :quarantine_log

    validates :brand, :result, :antigen_type, length: {minimum: 2}, presence: true
    validates :user_id, presence:true


    after_save :create_quarantine_log

    #If user is positive and has no postive entry the past 7 days,
    #>>Make new result and quarantine log for the last day of quarantine
    #if user is currently under going quarantine, the new qlog status would be Ongoing, regardless of result of test
    #if user is not under going quaratine and has negative result, the quarantinelog status will be "Random"
    def create_quarantine_log
        has_entry = QuarantineLog.where("date > ?", Date.today)

        if result == "Positive" && has_entry == false
            r = ResultLog.new(
                antigen_type: "Please post on designated date",
                result: "Please post on designated date",
                brand: "Please post on designated date",
                user_id: self.user_id
            )
            r.save
                if r.save == false
                    p r.error.full_messages
                end
            q = QuarantineLog.new(
                status: "Ended",
                date: Date.today + 7.days,
                user_id: r.user_id,
                result_log_id: r.id
            )
            q.save
                if q.save == false
                    p q.errors.full_messages
                end
        else
            q = QuarantineLog.new(
                status: "#{has_entry ? "Ongoing" : "Random Testing"}",
                date: Date.today,
                user_id: user_id,
                result_log_id: id
            )
            q.save
            if q.save == false
                p q.errors.full_messages
            end

        end

    end
end
