class Seeders::InitResultQuarantineData < ApplicationService
    def invoke
        @logger.info 'Priming results and quarantine databases'

        result_log = 0

        for count in 1..3 do
            date = rand(2.years).seconds.ago
            date_count = 0
            7.times do
                createResult("Positive")
                QuarantineLog.create(
                    status: "#{date_count == 6 ? "Ended" : "Ongoing"}", 
                    date: "#{date + date_count.days}",
                    user_id: count,
                    result_log_id: result_log)
                date_count += 1
                result_log += 1
            end
        end

        @logger.info "User 1 to 3 underwent quarantine period"

        for count in 1..15 do
            date = rand(2.years).seconds.ago
            2.times do
                createResult("Negative")
                QuarantineLog.create(
                    status: "Random", 
                    date: "#{date}",
                    user_id: count,
                    result_log_id: result_log)
                result_log += 1
            end
        end

        @logger.info "All users had 2 random testing"

        @logger.info "Results and Quarantine database established"
    
    end

    def createResult(result)
        random = rand(0..2).to_i
        ran = random.even?

        type_list = File.open('app/assets/raw_data/antigen_type.txt').readlines.map(&:chomp)

        type = type_list[random]

        ResultLog.create(
            antigen_type: "#{type}", result: result,
            brand: "Sanofi")

    end

end