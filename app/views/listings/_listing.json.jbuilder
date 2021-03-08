json.extract! listing, :id, :title, :description, :price, :sold, :listing_type, :condition :created_at, :updated_at
json.url listing_url(listing, format: :json)
