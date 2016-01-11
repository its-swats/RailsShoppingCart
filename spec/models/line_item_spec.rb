require 'rails_helper'

RSpec.describe LineItem, type: :model do
  let(:good_item) {LineItem.new(product_id: 1, cart_id: 1)}
  let(:no_product) {LineItem.new(cart_id: 1)}
  let(:no_cart) {LineItem.new(product_id: 1)}

  describe 'validations' do
    it 'successfully saves a complete line item' do
        expect{good_item.save}.to change{LineItem.count}.by(1)
    end
    it 'fails when a product is not provided' do 
        no_product.save
        expect(no_product.errors[:product_id]).to include("can't be blank")
    end
    it 'fails when a cart is not provided' do 
        no_cart.save
        expect(no_cart.errors[:cart_id]).to include("can't be blank")
    end
  end
end
