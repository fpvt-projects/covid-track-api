module CovidData
    class Client
        def self.getData
            response = Request.call(http_method: 'get', endpoint: '/v2/countries/Philippines?yesterday=true&strict=true&query')
        end
    end
end