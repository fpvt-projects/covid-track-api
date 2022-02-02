require 'rest-client'

module Newsapi
    class Request
        BASE_URL = 'https://newsapi.org'
        API_KEY = ENV["NEWS_API_KEY"]

        def self.call(http_method:, endpoint:)
            result = RestClient::Request.execute(
                method: http_method,
                url: "#{BASE_URL}#{endpoint}#{API_KEY}",
                headers: {'Content-Type'=> 'application/json'}
            )     
            {code: result.code, status: 'Success', data:JSON.parse(result)}
        rescue RestClient::ExceptionWithResponse => error
            {code: error.http_code, status: error.message, data:Errors.map(error.http_code)}
        end
    end
end