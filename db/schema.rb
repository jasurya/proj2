  create_table "products", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "product_name"
    t.integer "product_code"
    t.string "product_image"
    t.integer "price"
    t.integer "quantity"
    t.string "user_unique_id"
    t.string "product_unique_id"
    t.string "product_image1"
    t.string "product_image2"
    t.string "product_image3"
    t.string "product_image4"
    t.string "product_image5"
    t.integer "product_size"
    t.integer "product_price"
    t.string "product_description"
  end


  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "phone_number"
    t.string "file_extension"
    t.string "language"
    t.string "roles", default: "user"
    t.string "cart_unique_id"
    t.string "password_digest"
    t.string "unique_id"
  end



end
