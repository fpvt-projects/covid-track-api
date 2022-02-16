require 'rails_helper'

def authenticated_header(acc)
    token = Knock::AuthToken.new(payload: {sub: acc.id}).token
    {'Authorization': "#{token}" }
end

RSpec.describe 'JWT', type: :request do

    let(:account) {Account.new(
        email: "aqw@gmail.com",
        password: "qwer1234",
        password_confirmation: "qwer1234"
    )}

    let(:user) {User.new(lastname: "Madrigal", firstname: "Bruno", middlename: "Silenzio", address: "Casa Madrigal", region: "NCR", cellnumber: "09188875565", birthdate: Date.parse("January 27 2000"), gender: "Male", account_id: 2)}

    context "Authenticate users" do
        it 'When the request has no token, should return unauthorized' do
            get "/v1/users"
            expect(response).to have_http_status(:unauthorized)
        end

        it 'Request has valid token, should return http status 200' do
            account.save
            user.save
            get "/v1/users/1", headers: authenticated_header(account) 
            expect(response).to have_http_status(200)
        end
    end
end