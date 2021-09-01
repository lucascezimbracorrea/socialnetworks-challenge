require 'net/http'

module Facebook
    class FacebookService < ApplicationService
        TAKEHOME_URL = "https://takehome.io/facebook"

        def call
            _return = []
            _response = RequestService::call(FacebookService::TAKEHOME_URL)
            
            if _response.code.to_i == 200
                _return = _response.body 
            end
            
            _return
        end
    end
end