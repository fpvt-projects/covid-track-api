class Seeders::InitResultQuarantineData < ApplicationService
    require 'date'
    def invoke
        @logger.info 'Priming results and quarantine databases'
        user_ids = ActiveRecord::Base.connection.select_values("select id from Accounts")

        result_log = 0

        #quarantine simulation for 7 days. The patient should attain a negative result on or before the last day of quarantine
        for id in 1..3 do
            #random dates from Jan 1 2019 to Jan 1 2021
            randomer = rand(1546323227..1641709011)
            date_count = 0
            7.times do
                createResult("#{date_count > 4 ? "Negative" : "Positive"}", id)
                result_log += 1
                q = QuarantineLog.new(
                    status: "#{date_count == 6 ? "Ended" : "Ongoing"}", 
                    date: Date.parse((Time.at(randomer) + date_count.days).to_s),
                    user_id: id,
                    result_log_id: result_log)
                date_count += 1
                q.save 
                if q.save == false
                    @logger.info `#{q.errors.full_messages}`
                end
            end
        end

        @logger.info "User 1 to 3 underwent quarantine period"

        # loops for random testing
        user_ids.each do |id|
            randomer = rand(1546323227..1641709011)
            date = Date.parse(Time.at(randomer).to_s)
            2.times do
                createResult("Negative", id)
                QuarantineLog.create(
                    status: "Random", 
                    date: date,
                    user_id: id,
                    result_log_id: result_log)
                result_log += 1
            end
        end

        @logger.info "All users had 2 random testing"

        @logger.info "Results and Quarantine database established"
    
    end

    #separate function for randomized antigen type test
    def createResult(result, id)
        random = rand(0..2).to_i
        ran = random.even?

        type_list = File.open('app/assets/raw_data/antigen_type.txt').readlines.map(&:chomp)

        type = type_list[random]

        r = ResultLog.new(
            antigen_type: "#{type}", 
            result: result,
            brand: "Sanofi",
            user_id: id
        )

        r.save

        if r.save == false
            @logger.info "#{r.errors.full_messages}"
        end

    end

end