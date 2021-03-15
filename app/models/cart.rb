class Cart < ApplicationRecord
    #A cart has many line items
    has_many :line_items, dependent: :destroy

    #Listing as attr
    def add_listing(listing)
        #Find listing id and equal it to current line (local variable)
        current_item = line_items.find_by(listing_id: listing.id)
        #If exists can increment it, instad of creating two line_items
        if current_item
            current_item.increment(:quantity)
        else
        #If does not exists, create new line item and equal it to current listing id
            current_item = line_items.build(listing_id: listing.id)
        end
        current_item
    end
    #Takes all listings added to cart into an array and totaling the price of array elements
    def total_price
        line_items.to_a.sum { |item| item.total_price }
      end
end
