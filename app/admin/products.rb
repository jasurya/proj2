ActiveAdmin.register Product do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  actions :index, :edit, :update, :create, :destroy,:new 
  permit_params :product_name, :product_code, :product_image, :price, :quantity
  
  
end
