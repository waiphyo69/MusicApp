class SessionsController < ApplicationController
	def new
		render :new
	end

	def create
		user = User.find_by_credentials(params[:user][:user_name],
																		 params[:user][:password])
		if user
			log_in!(user)
			redirect_to user_url(user)
		else
			flash.now[:errors] =["Incorrect username and or password!"]
			render :new
		end
	end

	def destroy
  	logut_user!
		redirect_to new_user_url
	end
end
