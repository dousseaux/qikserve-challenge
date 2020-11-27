# encoding: UTF-8

class PagesController < ApplicationController

    def index
        @config[:title] = "Dashboard - #{@config[:name]}"
        @products = Product.list
        # @products = []
        # Product.list.each do |p|
        #     @products.push(Product.get(p.id))
        # end
        # render json: @products
    end

end
