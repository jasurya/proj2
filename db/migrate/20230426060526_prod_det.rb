class ProdDet < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :product_size, :integer
    add_column :products, :product_price, :integer
    add_column :products, :product_description, :string


  end
end
