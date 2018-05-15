class Currency < ApplicationRecord
	has_many :ratios

	def price(from_currency = nil)
		from_ratio = from_currency.nil? ? Currency.default_ratio : from_currency.ratios.last.ratio
		(from_ratio / current_ratio).round(3)
	end

	def current_ratio
		self.ratios.last.ratio
	end

	def self.default_ratio
		Currency.find_by(name: 'USD').ratios.last.ratio
	end
end
