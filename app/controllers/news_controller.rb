class NewsController < ApplicationController
    def index
        @news = Newsapi::Client.getnews
        render json: @news
    end
end