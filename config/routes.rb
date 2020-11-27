# frozen_string_literal: true

Rails.application.routes.draw do

    root 'pages#index'

    # Cart Controller
    post   '/cart',                   to: 'cart#add',                  as: 'cart'
    delete '/cart/:id',               to: 'cart#remove',               as: 'cart_item'
    delete '/cart/checkout',          to: 'cart#checkout',             as: 'cart_checkout'

end
