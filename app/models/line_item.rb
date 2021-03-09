class LineItem < ApplicationRecord
  belongs_to :listing
  belongs_to :cart

  def total_price
    listing.price.to_i * quantity.to_i
  end
end
