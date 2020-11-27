# encoding: UTF-8

class CartController < ApplicationController

    def add
        if session[:cart].blank?
            session[:cart] = []
        end
        session[:cart].push({
            id: params[:product][:id],
            qtt: params[:product][:qtt].to_i
        })
        redirect_to root_path
    end

    def remove
        if session[:cart].blank?
            session[:cart] = []
        end
        session[:cart].delete_if { |p| p['id'] == params[:id] }
        redirect_to root_path
    end

    def checkout
        @config[:title] = "Checkout - #{@config[:name]}"
        @cart = Cart.new(session[:cart])
    end

end
