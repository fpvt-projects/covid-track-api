class V1::RegistrationsController < ApplicationController
    def create
        account = Account.create!(
            email: params['email'],
            password: params['password'],
            password_confirmation: params['password_confirmation']
        )

        if account
            session[:account_id] = account.id
            render json: {
                status: :created,
                account: account
            }
        else
            render json: {status: 500}
        end
    end
end