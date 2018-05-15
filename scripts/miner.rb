require 'httparty'
require 'digest'
class Miner
	include HTTParty
base_uri 'http://localhost:9000'

def initialize(nonce, address)
	@nonce = nonce
	@address = address
end

def start_mining
response = self.class.get( '/getUnminedBlock')
block = JSON.parse(response.parsed_response, symbolize_names: true)
mined_block = mine(block[:block], block[:difficulty])

response = self.class.get( "/addMinedBlock?nonce=#{mined_block[:nonce]}&miningRewardsAddress=#{@address}")
blockInfo = JSON.parse(response.parsed_response, symbolize_names: true)

if blockInfo.count == 0
	puts "Block was not accepted"
else
	puts "Accepted block: #{blockInfo}"
end

end

private 

def mine(block,difficulty)

	block[:nonce] = @nonce.to_i

	loop do 
		break if block_mined?(block,difficulty)
		block[:nonce] += 1
		block[:hash] = calculate_hash(block)
	end
	puts "Block mined with nonce #{block[:nonce]}"
	puts "Calculated hash: #{block[:hash]}"
	#puts "Block: #{block}"
	block
end

def block_mined?(block,difficulty)
	!block[:hash].nil? && block[:hash][0..difficulty-1] == '0' * difficulty

end

def calculate_hash(block)
	block_info = "#{block[:previousHash]}#{block[:transactions].to_json}#{block[:nonce]}"
	#puts block_info
	Digest::SHA256.hexdigest("#{block_info}")

end

end
nonce = ARGV[0]
address = ARGV[1]


miner = Miner.new(nonce, address)
miner.start_mining