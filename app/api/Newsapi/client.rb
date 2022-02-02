module Newsapi
    class Client
        def self.getnews
            response = Request.call(http_method: 'get', endpoint: '/v2/top-headlines?country=ph&apiKey=')
        end
    end
end