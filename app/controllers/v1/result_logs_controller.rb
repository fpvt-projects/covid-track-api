class V1::ResultLogsController < ApplicationController
    before_action :authenticate_user

    #show only user specific result_logs
    def index
        @user = User.find_by(id: params[:user_id])
        @result_logs = @user.result_logs
        render json: @result_logs
    end

    def create
        @result_log = ResultLog.new(result_log_params)

        if @result_log.save
            render json: @result_log, status: :created
          else
            render json: @result_log.errors.full_messages, status: :unprocessable_entity
        end
    end

    #can only be update if its the 7th day of quarantine
    #NOT YET TESTED
    def update
        only_today = QuarantineLog.same_day.same_user
        if @result_log.update(result_log_params) && only_today
            render json: @result_log
        else
            render json: @result_log.errors,
            status: :unprocessable_entity
        end
    end

    private

    def set_result_log
        @result_log = ResultLog.find(params[:id])
    end

    def result_log_params
        params.require(:result_log).permit(:antigen_type, :result, :brand, :user_id)
    end

    # def quarantine_log_params 
    #     params.require(:quarantine_log).permit(:date, :status, :user_id, :result_log_id)
    # end
end
