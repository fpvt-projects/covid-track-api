class V1::ResultsLogsController < ApplicationController
    def index
        @result_logs = Result_log.all
        render json: @result_logs
    end
end
