class V1::QuarantineLogsController < ApplicationController
    before_action :authenticate_user

    #show only quarantine logs specific to the user 
    def index
        @quarantine_logs = QuarantineLog.where(user_id: params[:user_id])
        render json: @quarantine_logs
    end

    #note: Quarantine Logs is dependent on Results_log_id and User_id.
    #note: Result Logs and Quarantine logs is 1:1, user and quarantine is 1:many
    ##note: we wont be needing this anymore since its creation is tied to the result logs
    def create
        # @quarantine_log = QuarantineLog.new(quarantine_log_params)

        # if @quarantine_log.save
        #     render json: @quarantine_log, status: :create
        # else
        #     render json: @journal.errors.full_messages, status: :unprocessable_entity
        # end
    end

    private

    def set_quarantine_log
        @quarantine_log = QuarantineLog.find(params[:id])
    end

    # def quarantine_log_params 
    #     params.require(:quarantine_log).permit(:date, :status, :user_id, :result_log_id)
    # end
end
