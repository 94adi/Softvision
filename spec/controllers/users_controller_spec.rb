require 'rails_helper'

RSpec.describe UsersController, type: :controller do
it 'should not create a user' do
	post :create, params: {user: {name: 'name'} }
	expect(response.status).to eq 302
	expect(response.status).to redirect_to('/signup')
	expect(User.count).to eq 0 
end

it 'should create a user' do
	post :create, params: {user: {name: 'test3333', password: "asdasdasd", password_confirmation: "asdasdasd"} }
	expect(response.status).to eq 302
	expect(response.status).to redirect_to('/')
	expect(User.count).to eq 1 
end

end