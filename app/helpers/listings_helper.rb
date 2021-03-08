module ListingsHelper

    def listing_type(listing_type)
        if listing_type == "Full-time"
          content_tag :span, "#{listing_type}"
        elsif listing_type == "Strength"
          content_tag :span, "#{listing_type}"
        elsif listing_type == "Cardio"
          content_tag :span, "#{listing_type}"
        elsif listing_type == "Boxing"
          content_tag :span, "#{listing_type}"
        elsif listing_type == "Misc"
            content_tag :span, "#{listing_type}"
        else
          ""
        end
      end
end
