class V1::RegistrationsController < ApplicationController
    def create
        account = Account.new(
            email: params['email'],
            password: params['password'],
            password_confirmation: params['password_confirmation']
        )
        account.save

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