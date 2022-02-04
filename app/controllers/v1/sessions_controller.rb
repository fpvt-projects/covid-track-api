class V1::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token, only: [:create], raise: false
    before_action :authenticate_user

    def create
        account = Account
            .find_by(email: params["email"])
            .try(:authenticate, params["password"])
        
        if account
            session[:account_id] = account.id
            render json: {
                status: :created,
                account: account
            }
        else
            render json: { status: 401 }
        end

    end

end