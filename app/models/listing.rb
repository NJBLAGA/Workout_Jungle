class Listing < ApplicationRecord
before_destroy :not_referenced_by_any_line_item
belongs_to :user, optional: true
has_one_attached :image
has_many :line_items

  validates :title, :condition, :price, :listing_type, :image, presence: true
  validates :description, length: { maximum: 1000, too_long: "%{count} characters is the maximum aloud. "}
  validates :title, length: { maximum: 150, too_long: "%{count} characters is the maximum aloud. "}
  validates :price, length: { maximum: 7 }

  CONDITION = %w{ New Excellent Mint Used Fair Poor }
  LISTING_TYPES = ["Strength", "Cardio", "Boxing", "Misc"]

  private

  def not_referenced_by_any_line_item
    unless line_items.empty?
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end
