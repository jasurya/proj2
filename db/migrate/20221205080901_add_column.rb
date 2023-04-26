class AddColumn < ActiveRecord::Migration[7.0]
  def change
    # ---------------------------------Products-----------------------
    add_column :products, :product_name, :string
    add_column :products, :product_code, :integer
    add_column :products, :product_image, :string
    add_column :products, :price, :integer
    add_column :products, :quantity, :integer


    # -----------------------------------Users------------------------------------
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :email, :string
    add_column :users, :password, :integer
    add_column :users, :phone_number, :integer
    add_column :users, :file_extension, :string
    add_column :users, :language, :string

  end
end
