class Seeders::InitAccountUserData < ApplicationService
    def invoke 
        @logger.info 'Initializing accounts database restart'
        Account.destroy_all 
        User.destroy_all
        Journal.destroy_all
        ResultLog.destroy_all
        QuarantineLog.destroy_all
        @logger.info 'Purged all previous datas'

        count = 0

        15.times do 
            Account.create(email: "Tester0#{count}@gmail.com", password: "testing123")
            count += 1
        end

        @logger.info "15 accounts created"

        @logger.info "Fetching dummy data from text files"

        #converting the text file to array
        lastname_list = File.open('app/assets/raw_data/lastname.txt').readlines.map(&:chomp)
        firstname_list = File.open('app/assets/raw_data/firstname.txt').readlines.map(&:chomp)
        region_list = File.open('app/assets/raw_data/region.txt').readlines.map(&:chomp)

        count = 0

        15.times do
            bool = count.even?
            lastname = lastname_list[count]
            firstname = firstname_list[count]
            region = region_list[count]
            date = Date.parse("May 14 1980") 
            User.create(
                lastname: "#{lastname}",
                firstname: "#{firstname}", 
                middlename: "#{bool ? "dummy" : nil }", 
                address: "#{firstname} street, #{lastname} city, #{count}",
                city: "#{region}",
                gender: "#{bool ? "Female" : "Male"}",
                cellnumber: "090#{10000000 + count}",
                birthdate: "#{date + count}",
                account_id: count
            )
            count += 1
        end

        @logger.info "15 user data created"

    end
end