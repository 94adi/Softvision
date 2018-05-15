class Ammount < ApplicationRecord
	belongs_to :user
	belongs_to :currency
end
