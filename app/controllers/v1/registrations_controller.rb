class V1::RegistrationsController < ApplicationController
    def create
        @account = Account.new(account_params)
        if @account.save
            session[:account_id] = account.id
            render json: {
                status: :created,
                account: account
            }
        else
            render json: {status: 500}
        end
    end

    private

    def account_params 
        params.require(:account).permit(:email, :password, :password_confirmation)
    end

end