class ApplicationController < ActionController::Base

    include ApplicationHelper

    before_action do
        @config = Rails.configuration.x.preoday_challenge
    end

end
