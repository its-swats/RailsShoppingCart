require 'rails_helper'

RSpec.describe LineItemsController, type: :controller do
	let!(:admin) {FactoryGirl.create :user}
	let!(:product) {FactoryGirl.create :product}
	let!(:cart) {admin.carts.create}

	describe 'lineitem#create' do
		it 'creates a new line item' do
			session[:user_id] = admin.id
			expect{xhr :post, :create, user_id: admin.id, product_id: product.id, total_quantity: 1 }.to change{LineItem.count}.by(1)
		end
		it 'can create 100 new line item' do
			session[:user_id] = admin.id
			expect{xhr :post, :create, user_id: admin.id, product_id: product.id, total_quantity: 100 }.to change{LineItem.count}.by(100)
		end
	end

	describe 'lineitem#destroy' do 
		it 'destroys a single line item' do 
			session[:user_id] = admin.id
			item = admin.cart.line_items.create(product_id: 1)
			expect{delete :destroy, id: item.id }.to change{LineItem.count}.by(-1)
		end
	end
end
