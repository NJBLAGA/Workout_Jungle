module ApplicationHelper
    #Dislay counter if counter above 1 in cart(wishlist)
    def cart_count_over_one
        return total_cart_items if total_cart_items > 0
      end
      #Display total items in cart
      def total_cart_items
        total = @cart.line_items.map(&:quantity).sum
        return total if total > 0
      end
    #Kramdown markdown method
    def markdown_to_html(text)
      Kramdown::Document.new(text).to_html
    end
end
