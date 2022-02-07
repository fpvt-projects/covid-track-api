class Seeders::InitJournalData < ApplicationService
    def invoke
        @logger.info 'Booting up journals database'

        for user in 1..15 do
            if user.odd?
                2.times do
                    date = rand(2.years).seconds.ago
                    Journal.create(
                        title: "Journal entry: #{date}",
                        content: "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system.",
                        user_id: user
                    )
            end
            @logger.info "User #{user} has 2 journal entry"
        end
    end
    @logger.info "All databases are now operating"
end
end