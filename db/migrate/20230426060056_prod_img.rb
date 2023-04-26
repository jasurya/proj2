class ProdImg < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :product_image1, :string
    add_column :products, :product_image2, :string
    add_column :products, :product_image3, :string
    add_column :products, :product_image4, :string
    add_column :products, :product_image5, :string
  end
end
