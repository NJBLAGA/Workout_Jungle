class Listing < ApplicationRecord
before_destroy :not_referenced_by_any_line_item
#Relationships
#A listing belongs to one user
belongs_to :user, optional: true
#A listing has one image atatched to it
has_one_attached :image
#A listing may belong to many carts and so has many line_items
has_many :line_items

  #Back End Validations
  #Fields must have data when user submits the listing
  validates :title, :condition, :price, :listing_type, :image, presence: true
  #Following fields have length restrictions
  validates :description, length: { maximum: 1000, too_long: "- %{count} characters is the maximum allowed. "}
  validates :title, length: { maximum: 25, too_long: "- %{count} characters is the maximum allowed. "}
  validates :price, length: { maximum: 7, too_long: "- %{count} digits is the maximum allowed. " }

  #Shorthand array that contains all conidtions and listing types
  CONDITION = %w{ New Excellent Mint Used Fair Poor }
  LISTING_TYPES = ["Strength", "Cardio", "Boxing", "Misc"]

  private
  #Checking if line items are empty
  def not_referenced_by_any_line_item
    unless line_items.empty?
      #Dont send errors if line items are empty
      errors.add(:base, "Line items present")
      throw :abort
    end
  end
end


