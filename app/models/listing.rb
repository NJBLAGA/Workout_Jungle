class Listing < ApplicationRecord
belongs_to :user, optional: true

  validates :title, :condition, :price, :listing_type, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "}
  validates :title, length: { maximum: 150, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, length: { maximum: 7 }

  CONDITION = %w{ New Excellent Mint Used Fair Poor }
end
