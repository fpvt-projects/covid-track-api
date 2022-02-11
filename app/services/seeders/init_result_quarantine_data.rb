class Seeders::InitResultQuarantineData < ApplicationService
    require 'date'
    def invoke
        @logger.info 'Setting up local application case counter'

        counter = CaseCount.new(
            total_cases: 0,
            total_recoveries: 0,
            active_cases: 0,
            daily_new: 0,
            daily_recovered: 0
        )
        if counter.save
            @logger.info 'counter established'
        else
            @logger.info counter.errors.full_messages
        end
        @logger.info 'Priming results and quarantine databases'
        user_ids = ActiveRecord::Base.connection.select_values("select id from Accounts")

        result_log = 0

        # loops for random testing
        user_ids.each do |id|

            if id < 3
                2.times do
                createResult("Positive", id)
                end
            else
            2.times do
                createResult("Negative", id)
                end
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

        rs = ResultLog.new(
            antigen_type: "#{type}", 
            result: result,
            brand: "Sanofi",
            user_id: id
        )
        if rs.save == false
            @logger.info rs.errors.full_messages
        end

    end

end