class SessionsController < ApplicationController
before_action :verify_user, :only => :new

	def new

	end

	def create
		user = User.find_by(name: params[:name])
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/welcome'
		else
			redirect_to '/login', alert: 'Invalid user'
		end	

	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

	private

	def verify_user
		redirect_to '/welcome' unless !current_user 
	end

end