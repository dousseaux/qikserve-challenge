# encoding: UTF-8

class PagesController < ApplicationController

    def index
        @config[:title] = "Dashboard - #{@config[:name]}"
        @products = Product.list
    end

end
