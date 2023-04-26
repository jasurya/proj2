ActiveAdmin.register User do


  actions :index, :edit, :update, :create, :destroy,:new
  permit_params :first_name, :last_name, :email, :password, :phone_number, :file_extension, :language
  

 
end
