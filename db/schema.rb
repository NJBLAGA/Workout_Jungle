# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.
#
ActiveRecord::Schema.define(version: 2021_03_12_023809) do

  enable_extension "plpgsql"
    # These are extensions that must be enabled in order to support this database
    # Created from active storage install command
  create_table "active_storage_attachments", force: :cascade do |t|
    # Name of uploaded attachment
    t.string "name", null: false
    # Type of file uploaded
    t.string "record_type", null: false
    # Id given to each attachment
    t.bigint "record_id", null: false
    # Id given to blob/image itself
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end
 
  create_table "active_storage_blobs", force: :cascade do |t|
    # Image Table used to hold images uplodaed by users.
    # Created from active storage install command
    # Key indicator assigned to an image
    t.string "key", null: false
    #Filename of image
    t.string "filename", null: false
    # Type of MIME type of uploaded file
    t.string "content_type"
    #Attached data to image(filename,content type etc)
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    # t.index true means it is adding a database index to the referenced column, the role of indexes aids in speeding up queries. 
    # Without an index, the database would need to check every record in the projects table, one by one, until a match is found.
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

 
  create_table "admins", force: :cascade do |t|
    # Created when devise command was run to create the admin model
    # Should be noted that admin model does not require admin only passwords, emails or usanames, it relies on the username table
    # Admin's email set to default until admin enters it(not needed in Workout Jungle structure)
    t.string "email", default: "", null: false
    # Admins password set to default until admin enters it(not needed in Workout Jungle structure)
    t.string "encrypted_password", default: "", null: false
    # Database calls this token when user wishes to store a new password in place of their old one
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["email"], name: "index_admins_on_email", unique: true
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["reset_password_token"], name: "index_admins_on_reset_password_token", unique: true
  end

  create_table "carts", force: :cascade do |t|
    # Created with a cart migration
    # Carts table acts as a storage to hold a users wish list, they hold line_items which house the listings(items) themseleves
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "conversations", force: :cascade do |t|
    # Created when conversation model was scaffoled
    # Each user is assigned a sender_id and recipient_id for every conversation they have with another user
    # Example: if Tom messages Kate, Tom is assigned a sender_id, while Kate is assigned a recipient_id, however the roles would be reversed if Kate messaged Tom
    # The model than queries based on the two indexes when creating the conversation between the two users
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "line_items", force: :cascade do |t|
    # Created with line_item migration
    # Foreign key for listing_id
    t.bigint "listing_id", null: false
    # Foreign key for cart_it
    t.bigint "cart_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    # A value that represents the amount an item is represented in the line_item(a counter), for example: 20kg Plate x 2 (meaning there are two plates within that line item)
    t.integer "quantity", default: 1
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["cart_id"], name: "index_line_items_on_cart_id"
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["listing_id"], name: "index_line_items_on_listing_id"
  end

  create_table "listings", force: :cascade do |t|
    # Created when listing model was scaffoled 
    # A listing has a title
    t.string "title"
    # A listing has a description
    t.text "description"
    # A listing has a condition
    t.string "condition"
    # A listing has a price with a default of $0
    t.decimal "price", precision: 5, scale: 2, default: "0.0"
    # A listing has a listing_type(category)
    t.string "listing_type"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    # Foreign key of user_id to assoicate one listing to one user
    t.integer "user_id"
  end

  create_table "messages", force: :cascade do |t|
    # Created when message model was scaffoled
    # A message has a body of text displaying related information between users
    t.text "body"
    # A message belongs to one conversation (foreign key)
    t.bigint "conversation_id"
    # A message belongs to one user (foreign key)
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
     # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["user_id"], name: "index_messages_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    # Created when devise command was run to create the user model
    # Each user has an email, default to an empty string till they sign up
    t.string "email", default: "", null: false
    # Each user has an password default to an empty string till they sign up
    t.string "encrypted_password", default: "", null: false
    # Database calls this token when user wishes to store a new password in place of their old one
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    # Each user has an username, default to an empty string till they sign up
    t.string "username"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    # By default admin for all users is set to false, when set to true through seeding, or admin dahsboard, they are considered an admin
    t.boolean "admin", default: false
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["email"], name: "index_users_on_email", unique: true
    # t.index is adding a database index to the referenced column, allows the model to query more efficiently based on said index
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end
  #Adding foreign keys to tables:
  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "line_items", "carts"
  add_foreign_key "line_items", "listings"
end
