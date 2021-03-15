class LineItem < ApplicationRecord
  #Line item belongs to a list
  belongs_to :listing
  #Line item belongs to a cart
  belongs_to :cart

  #Method for cart that mutltiples the price of an listing with the quantity selected within the cart
  def total_price
    listing.price.to_i * quantity.to_i
  end
end
