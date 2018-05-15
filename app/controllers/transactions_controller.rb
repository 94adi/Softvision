class TransactionsController < ApplicationController

	def index
    	@transactions = Transaction.all
  	end

	def create
		transaction = Transaction.new(transactions_params)
		transaction.save
	end

	def transactions_params
		params.require(:transaction).permit(:user_id, :original_currency_id, :original_currency_amount, :final_currency_id, :final_currency_amount)
	end

end