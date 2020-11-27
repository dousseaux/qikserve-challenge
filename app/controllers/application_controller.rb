class ApplicationController < ActionController::Base

    include ApplicationHelper

    before_action do
        @config = Rails.configuration.x.qikserve_challenge
    end

end
