class V1::QuarantineLogsController < ApplicationController

    def index
        @quarantine_logs = Quarantine_logs.all
        render json: @quarantine_logs
    end
end
