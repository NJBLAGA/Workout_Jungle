module CurrentCart
#Creating a sort of cookie 
    private
  
    def set_cart
         #Find cart by current session
         @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
         #If cart is not found, cart will be created
         @cart = Cart.create
         #Make session id equal to cart id
         session[:cart_id] = @cart.id
    end
end