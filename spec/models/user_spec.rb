require 'rails_helper'

RSpec.describe User, type: :model do
	it 'should validate the name' do
		user = User.new
		
		user1 = User.create(name: "test222", password_digest: "asdasdasd")
	
		user2 = User.new(name: "test222")

		expect(user.valid?).to be false
		expect(user.errors[:name]).to eq ["can't be blank"]

		expect(user2.valid?).to be false
		expect(user2.errors[:name]).to eq ["has already been taken"]
	end

end