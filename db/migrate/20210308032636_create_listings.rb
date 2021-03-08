class CreateListings < ActiveRecord::Migration[6.0]
  def change
    create_table :listings do |t|
      t.string :title
      t.text :description
      t.string :condition
      t.decimal :price, precision: 5, scale: 2, default: 0
      t.boolean :sold
      t.string :listing_type

      t.timestamps
    end
  end
end
