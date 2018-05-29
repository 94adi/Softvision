class GenerateRatiosWorker

@queue = :generate_ratios

	def self.perform
		Currency.where.not(default: true).each do |c| 	
			Ratio.create(currency_id: c.id, ratio: rand(1..30))
		end
		puts "Ratios changed!"
	end

end