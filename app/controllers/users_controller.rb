class UsersController < ApplicationController

	def new
		@user = User.new
	end

	def create
		user = User.new(user_params)
		if user.save
			session[:user_id] = user.id
			#when a new user is created, add a default ammount in USD
			Ammount.create(quantity: 1000, user_id: user.id, currency_id: Currency.find_by(default: true).id)
			redirect_to '/'
		else
			redirect_to '/signup', alert: 'Invalid name/password combination'
		end
	end

	def user_params
		params.require(:user).permit(:name, :password, :password_confirmation)

	end

end