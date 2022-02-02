class CovidController < ApplicationController
    def index
        @covidData = CovidData::Client.getData
        render json: @covidData
    end
end