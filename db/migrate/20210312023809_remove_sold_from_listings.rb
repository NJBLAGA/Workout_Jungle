class RemoveSoldFromListings < ActiveRecord::Migration[6.0]
  def change
    remove_column :listings, :sold, :boolean
  end
end
