require 'rails_helper'


RSpec.describe 'API', type: :request do
    acc = Account.new(
        email: "aq@gmail.com",
        password: "qwer1234",
        password_confirmation: "qwer1234"
    )
    acc.save

    # user = User.new(lastname: "Madrigal", firstname: "Bruno", middlename: "Silenzio", address: "Casa Madrigal", region: "NCR", cellnumber: "09188875555", birthdate: Date.parse("January 27 2000"), gender: "Male", account_id: 1)
    # user.save

    context 'Fetching data from other API' do
        it 'Covid-data' do
            get "/covid-data"
            expect(response).to have_http_status(:success)
        end

        it 'latest-news' do
            get "/latest-news"
            expect(response).to have_http_status(:success)
        end

        # it 'latest-news' do
        #     post "/auth", account: {auth: {email: 'aq@gmail.com', password: "qwer1234"}}
        #     expect(response).to have_http_status(:success)
        # end
    end
end