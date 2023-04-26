class Col < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :product_unique_id, :string
  end
end
