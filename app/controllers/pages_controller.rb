# encoding: UTF-8

class PagesController < ApplicationController

    def index
        @config[:title] = "Dashboard - #{@config[:name]}"
    end

end
