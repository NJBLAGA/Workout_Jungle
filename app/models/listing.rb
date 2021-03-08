class Listing < ApplicationRecord
belongs_to :user, optional: true
has_one_attached :image

  validates :title, :condition, :price, :listing_type, :image, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "}
  validates :title, length: { maximum: 150, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, length: { maximum: 7 }

  CONDITION = %w{ New Excellent Mint Used Fair Poor }
end
