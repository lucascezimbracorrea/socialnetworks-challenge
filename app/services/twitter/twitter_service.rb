require 'net/http'

module Twitter
    class TwitterService < ApplicationService
        TAKEHOME_URL = "https://takehome.io/twitter"

        def call
            _return = []
            _response = RequestService::call(TwitterService::TAKEHOME_URL)
            
            if _response.code.to_i == 200
                _return = _response.body 
            end

            _return
        end
    end
end