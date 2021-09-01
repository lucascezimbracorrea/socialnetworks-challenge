module SocialNetworks
    class SocialNetworksService < ApplicationService
        attr_accessor :social_network_return

        def initialize
            @social_network_return = SocialNetworks::SocialNetworksServiceReturn.new
        end

        def call
            begin
                Rails.application.executor.wrap do
                    _threads = []
                    _threads << twitter()
                    _threads << facebook()
                    _threads << instagram()

                    _threads.each(&:join)
                end
            rescue => exception
                puts exception
            end

            @social_network_return
        end

        def twitter
            _thread = Thread.new do
                Rails.application.executor.wrap do
                    @social_network_return.twitter = Twitter::TwitterService.call
                end
            end
            
            _thread
        end

        def facebook
            _thread = Thread.new do
                Rails.application.executor.wrap do
                    @social_network_return.facebook = Facebook::FacebookService.call
                end
            end
            
            _thread
        end

        def instagram
            _thread = Thread.new do
                Rails.application.executor.wrap do
                    @social_network_return.instagram = Instagram::InstagramService.call
                end
            end
            
            _thread
        end
    end

    class SocialNetworksServiceReturn
        attr_accessor :twitter, :facebook, :instagram

        def initialize
            @twitter = []
            @facebook = []
            @instagram = []
        end
    end
end