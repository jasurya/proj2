module ProductInformation
	class ProductService

		def self.get_all_products()
			informations=Product.all
			return informations
			
		end

		def self.products_owner
			informations=Product.all
			
			return informations
			
		end


		def self.new_product
			product = Product.new 
		end

		def self.edit_product(product_unique_id)
			product = Product.find_by(product_unique_id: product_unique_id)
		end

		def self.update_product(product_unique_id, params)
			product = Product.where(is_active: true).find_by(product_unique_id: product_unique_id)
			product.update(params)
		end

	

		def self.create_product(params,user_id)
			product_unique_id = SecureRandom.alphanumeric(6)
			product = Product.create(product_unique_id: product_unique_id,user_unique_id:user_id ) 
			@product = product.update(params)
		end




		def self.delete_product(product_unique_id)
			product = Product.find_by(product_unique_id: product_unique_id)
			product.update(is_active:false)
		end
	end
end