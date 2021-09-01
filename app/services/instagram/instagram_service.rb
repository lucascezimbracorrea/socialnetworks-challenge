require 'net/http'

module Instagram
    class InstagramService < ApplicationService
        TAKEHOME_URL = "https://takehome.io/instagram"

        def call
            _return = []
            _response = RequestService::call(InstagramService::TAKEHOME_URL)
            
            if _response.code.to_i == 200
                _return = _response.body 
            end
            
            _return
        end
    end
end