module ApplicationHelper
    def cart_count_over_one
        return total_cart_items if total_cart_items > 0
      end
    
      def total_cart_items
        total = @cart.line_items.map(&:quantity).sum
        return total if total > 0
      end

    def markdown_to_html(text)
      Kramdown::Document.new(text).to_html
    end
      
    def trade_author(item)
      user_signed_in? && current_user.id == item.user_id
    end
end
