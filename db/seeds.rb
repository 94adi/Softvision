# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Currency.create(name: 'Bitcoin')
Currency.create(name: 'Ethereum')
Currency.create(name: 'Ripple')
Currency.create(name: 'Litecoin')
Currency.create(name: 'Cardano')
Currency.create(name: 'Stellar')
Currency.create(name: 'NEO')
Currency.create(name: 'IOTA')
Currency.create(name: 'EOS')
Currency.create(name: 'Bitcoin Cash')
Currency.create(name: 'Tron')
Currency.create(name: 'QTUM')
Currency.create(name: 'USD', default: true)

Currency.find_by(name: 'USD').update_attributes(symbol: 'USD')
Currency.find_by(name: 'Bitcoin').update_attributes(symbol: 'BTC')
Currency.find_by(name: 'Ethereum').update_attributes(symbol: 'ETH')
Currency.find_by(name: 'Ripple').update_attributes(symbol: 'RPL')
Currency.find_by(name: 'Litecoin').update_attributes(symbol: 'LTC')
Currency.find_by(name: 'Cardano').update_attributes(symbol: 'ADA')
Currency.find_by(name: 'Stellar').update_attributes(symbol: 'XLM')
Currency.find_by(name: 'NEO').update_attributes(symbol: 'NEO')
Currency.find_by(name: 'IOTA').update_attributes(symbol: 'IOT')
Currency.find_by(name: 'EOS').update_attributes(symbol: 'EOS')
Currency.find_by(name: 'Bitcoin Cash').update_attributes(symbol: 'BCH')
Currency.find_by(name: 'Tron').update_attributes(symbol: 'TRX')
Currency.find_by(name: 'QTUM').update_attributes(symbol: 'QTU')

User.all.each do |user| Ammount.create(quantity: 1000, user_id: user.id, currency_id: Currency.find_by(default: true).id) 
end

Ratio.create({
   currency_id: Currency.where(name: 'USD').first.id,
   ratio: 1
})
Ratio.create({
   currency_id: Currency.find_by(name: 'Bitcoin').id,
   ratio: 0.0001
})
Ratio.create({
   currency_id: Currency.find_by(name: 'Ethereum').id,
   ratio: 0.045
})
Ratio.create({
   currency_id: Currency.find_by(name: 'Ripple').id,
   ratio: 0.0056
})
Ratio.create({
   currency_id: Currency.find_by_name('Litecoin').id,
   ratio: 0.088
})
Ratio.create({
   currency_id: Currency.find_by(name: 'Cardano').id,
   ratio: 7.8
})
Ratio.create({
   currency_id: Currency.find_by(name: 'Stellar').id,
   ratio: 44
})
Ratio.create({
   currency_id: Currency.find_by(name: 'NEO').id,
   ratio: 67.12
})
Ratio.create({
   currency_id: Currency.find_by(name: 'IOTA').id,
   ratio: 1.34
})
Ratio.create({
   currency_id: Currency.find_by(name: 'EOS').id,
   ratio: 1.11
})
Ratio.create({
   currency_id: Currency.find_by(name: 'Bitcoin Cash').id,
   ratio: 0.1456
})
Ratio.create({
   currency_id: Currency.find_by(name: 'Tron').id,
   ratio: 13.067
})
Ratio.create({
   currency_id: Currency.find_by(name: 'QTUM').id,
   ratio: 0.98
})