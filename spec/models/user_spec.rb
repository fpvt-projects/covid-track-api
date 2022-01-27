require 'rails_helper'

RSpec.describe User, type: :model do

    let(:validuser) {User.new(lastname: "Madrigal", firstname: "Bruno", middlename: "Silenzio", address: "Casa Madrigal", city: "Casa de Papel", cellnumber: "09188875555", birthdate: Date.parse("January 27 2000"), age: 22, gender: "Male")}

    context "User schema validations" do
        it "is invalid due to lack of information" do
        user = User.new
        user.save 
        expect(user.errors.full_messages).to include("Lastname can't be blank",  "Firstname can't be blank", "Birthdate can't be blank", "Cellnumber can't be blank", "Gender can't be blank", "Address can't be blank", "City can't be blank")
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
            expect(user.errors.full_messages).to include("Birthdate must be less than 2022-01-27")
        end

        it "is invalid, cellnumbers should be unique" do
            validuser.save
            user = User.new(lastname: "Docter", firstname: "Pete", middlename: "Enrico", address: "Riviera", city: "itali", cellnumber: "09188875555", birthdate: Date.parse("December 27 2000"), age: 21, gender: "Female")
            user.save
            expect(user.errors.full_messages).to include ("Cellnumber has already been taken")
        end

        it "is VALID" do
            validuser.save
            expect(validuser).to be_valid
        end

    end



end