Rails.application.routes.draw do
root 'users#login_index'
   
#   ==============================Login Portions==================================================================

  get "/login", to: "users#login_index" , as: :login_index

  #---------------------------------Product and Product index--------------------------------------------------------
  
   get "/landing_page", to: "products#index" , as: :index 
   
   get "/product/product_index", to: "products#product_index", as: :product_index
   
   post "/products/all_product", to: "products#all_product"


   get "/products/new_product", to: "products#new_product",as: :new_product

   post "/products/create_product", to: "products#create_product",as: :create_product

   get "/products/edit_product/:product_unique_id", to: "products#edit_product",as: :edit_product

   put  "/products/update_product/:product_unique_id", to: "products#update_product",as: :update_product
   
   delete "/products/delete_product/:product_unique_id", to: "products#delete_product",as: :delete_product

       


   

  #--------------------------------------User--------------------------------------------------------
   get "/users/get_user", to: "users#user_index", as: :user_index
   get "/users/edit_user/:unique_id", to:  "users#edit_user", as: :edit_user
  put "/users/update_user/:unique_id", to:  "users#update_user",as: :update_user

   post "/users/create_user", to:  "users#create_user",as: :create_user

   post "/users/verify_user", to:  "users#verify_user",as: :verify_user



   delete "/users/delete_user", to:  "user#delete_user"

   get "/users/logout", to: "users#logout", as: :logout

   get "/new_user", to: "users#new_user", as: :new_user 

   get "/forget_password", to: "users#forget_password", as: :forget_password 



#  ---------------------------------show Routes-----------------------



  get "/product_owner_index",to: "products#product_owner_index", as: :product_owner_index

  post "/products/products_owner", to: "products#products_owner"





  

end
