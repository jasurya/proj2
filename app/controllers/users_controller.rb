class UsersController < ApplicationController
	
    skip_before_action :verify_authenticity_token
	require 'securerandom'
    before_action :user_require, only:[:index,:new,:edit,:show]
    before_action :verify_authorization, only:[:new,:create,:index,:delete]


	def create_user
		unique_id = SecureRandom.alphanumeric(20)
	 	cart_unique_id =  SecureRandom.alphanumeric(8)
		@user_info = ProductInformation::UserService.create_user(params["user"]["email"], params["user"]["password_digest"],  unique_id, cart_unique_id)
		if @user_info.errors.full_messages==[]
            session[:current_user_id] = @user_info.unique_id
            redirect_to user_index_path, notice: "New User Created Successfully"
        else
            render :login_index, status: :unprocessable_entity
        end
	end


	def update_password
		@user_login =  ProductInformation::UserService.update_user_password(params[:email],params[:password_digest])
        
        if @user_login.nil? 
            @user_login =  "email-id Doesn't Exists"
            render :login_index, status: :unprocessable_entity

        elsif @user_login == false 
            @user_login = "Email id is exists, but Incorrect password"
            render :login_index, status: :unprocessable_entity

        else
            session[:current_user_id] = @user_login.unique_id
            session[:current_user_role] = @user_login.roles
			redirect_to index_path
        end
	end

	def verify_user
        @user_login =  ProductInformation::UserService.user_login(params[:email],params[:password_digest])
        
        if @user_login.nil? 
            @user_login =  "email-id Doesn't Exists"
            render :login_index, status: :unprocessable_entity

        elsif @user_login == false 
            @user_login = "Email id is exists, but Incorrect password"
            render :login_index, status: :unprocessable_entity

        else
            session[:current_user_id] = @user_login.unique_id
            session[:current_user_role] = @user_login.roles
			redirect_to product_index_path
        end

    end 


	def logout
		session.clear
		redirect_to login_index_path
	end
	




	def user_index
		@user_info = ProductInformation::UserService.get_user(session[:current_user_id])
	
	end
		
	def login_index
		
	end

	def new_user 
        @new_user = ProductInformation::UserService.new()
    end


	def edit_user
		@countries = CS.countries.invert
		@states = CS.states(:us).invert
		@cities =CS.cities(:ak, :us)
		email_id = $session_user
		
		@user_info =ProductInformation::UserService.edit_user(params[:unique_id])
	end

    def update_user
		@user_info= ProductInformation::UserService.update_user(params[:unique_id],user_params)
		redirect_to user_index_path
	end



	def delete_user
		@data=ProductInformation::UserService.delete_user(user_id)
	end




	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :phone_number, :country, :city, :state, :file_extension, :cart_unique_id, :password_digest)
	end

end
