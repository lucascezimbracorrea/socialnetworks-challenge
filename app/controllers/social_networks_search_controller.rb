# app/controllers/social_networks_search_controller.rb
class SocialNetworksSearchController < ApplicationController
    # GET /
    def index
        json_response(SocialNetworks::SocialNetworksService::call)
    end
end
