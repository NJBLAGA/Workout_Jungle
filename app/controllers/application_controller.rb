class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception
    #Global access current cart helper to all controllers 
    include CurrentCart
    before_action :set_cart
end
