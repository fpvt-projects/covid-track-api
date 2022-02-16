require 'rails_helper'

RSpec.describe User, type: :model do

    # let(:account) {Account.new(
    #     email: "aq@gmail.com",
    #     password: "qwer1234",
    #     password_confirmation: "qwer1234"
    # )}

    # let(:validuser) {User.new(lastname: "Madrigal", firstname: "Bruno", middlename: "Silenzio", address: "Casa Madrigal", region: "NCR", cellnumber: "09188875545", birthdate: Date.parse("January 27 2000"), gender: "Male", account_id: 1)}

    context "User schema validations" do
        it "is invalid due to lack of information" do
        user = User.new
        user.save 
        expect(user.errors.full_messages).not_to be_empty
        end

        it "is invalid first name or last name should not be less than 2 characters" do 
            user = User.new(firstname:"S", lastname:"Y")
            user.save
            expect(user.errors.full_messages).to include("Lastname is too short (minimum is 2 characters)", "Firstname is too short (minimum is 2 characters)")
        end

        it "is invalid cellphone number should be between 11 to 13 characters and only numericals" do 
            minimum = User.new(cellnumber: "1234")
            maximum = User.new(cellnumber: "12345678909876")
            invalid = User.new(cellnumber: "abs12345678")
            minimum.save
            maximum.save
            invalid.save
            expect(minimum.errors.full_messages).to include("Cellnumber is too short (minimum is 11 characters)")
            expect(maximum.errors.full_messages).to include("Cellnumber is too long (maximum is 13 characters)")
            expect(invalid.errors.full_messages).to include("Cellnumber is invalid")
        end

        it "is invalid, the birth date should be less than the date today" do
            user = User.new(birthdate: Date.today)
            user.save
            expect(user.errors.full_messages).to include("Birthdate must be less than #{Date.today}")
        end

        it "is invalid, cellnumbers should be unique" do

            user = User.new(lastname: "Docter", firstname: "Pete", middlename: "Enrico", address: "Riviera", region: "NCR", cellnumber: "09188875555", birthdate: Date.parse("December 27 2000"), gender: "Female")
            user.save
            expect(user.errors.full_messages).to include ("Cellnumber has already been taken")
        end

        it "is VALID" do
            acc = create(:account)
            validuser = create(:user, cellnumber: "09010010129")
            expect(validuser).to be_valid
        end

    end


end