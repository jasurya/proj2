class ProductsController < ApplicationController
	
	skip_before_action :verify_authenticity_token
	
	def index
		@data=Product.all
		
	end

	

	def products_owner
	
		data = ProductInformation::ProductService.products_owner
		render json: data
	end


	def new_product
		@product_info=ProductInformation::ProductService.new_product
	end

	def create_product
		
		user_id = session[:current_user_id]
		@product_info = ProductInformation::ProductService.create_product(parameters,user_id)
		redirect_to product_owner_index_path
	end

	def edit_product
		@product_info=ProductInformation::ProductService.edit_product(params[:product_unique_id])
	end

	def update_product
		
		@product_info=ProductInformation::ProductService.update_product(params[:product_unique_id],parameters)
		redirect_to product_owner_index_path
	end


	def delete_product
	
		@product_info=ProductInformation::ProductService.delete_product(params[:product_unique_id])
		render json: @product_info
	end


	private
	
	def parameters
		params.require(:product).permit(:product_name, :product_code,:product_price, :product_size, :product_image1, :product_image2, :product_image3, :product_image4, :product_image5, :product_cart_id, :product_description, :product_image2)
	end
end
