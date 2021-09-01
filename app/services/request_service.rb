# app/services/request_service.rb
class RequestService
    ATTEMPTS = 3

    def self.call(url)
        _attempts = 0
        _success = false
        _response = false

        while _success == false && _attempts < RequestService::ATTEMPTS do
            _url = URI.parse(url)
            _resquest = Net::HTTP::Get.new(_url)
            _response = Net::HTTP.start(_url.host, _url.port, use_ssl: true) {|_http|
                _http.request(_resquest)
            }
            
            if _response.code.to_i == 200
                _success = true
            end
            
            _attempts += 1
        end

        _response
    end
end