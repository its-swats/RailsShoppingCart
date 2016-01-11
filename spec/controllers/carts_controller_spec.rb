require 'rails_helper'

RSpec.describe CartsController, type: :controller do
	let!(:admin) {FactoryGirl.create :user}
	let!(:product) {FactoryGirl.create :product}
	let!(:cart) {admin.carts.create}
	let(:item_in_cart) {FactoryGirl.create :line_item}


	describe 'carts#index' do
		it 'returns a list of items in the users cart' do 
			session[:user_id] = admin.id
			item = admin.cart.line_items.create(product_id: 1)
			get :index
			expect(assigns[:line_item]).to eq({1 => [item]})
		end
		it 'returns the users cart of items' do
			session[:user_id] = admin.id
			get :index
			expect(assigns[:cart]).to eq(User.find(admin.id).cart)
		end
	end

	describe 'carts#destroy' do 
		it 'empties all line items from a users cart' do
			session[:user_id] = admin.id
			admin.cart.line_items.create(product_id: 1)
			expect{delete :destroy, id: admin.id}.to change{LineItem.count}.by(-1)
		end
	end
end
