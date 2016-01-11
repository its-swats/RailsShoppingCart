require 'rails_helper'

RSpec.describe Product, type: :model do

  let(:good_product) {Product.new(title: 'Title', description: 'desc', price: 50, quantity: 50)}
  let(:product_no_title) {Product.new(description: 'desc', price: 50, quantity: 50)}
  let(:product_no_desc) {Product.new(title: 'Title', price: 50, quantity: 50)}
  let(:product_no_price) {Product.new(title: 'Title', description: 'desc', quantity: 50)}
  let(:product_no_qty) {Product.new(title: 'Title', description: 'desc', price: 50)}
  let(:product_with_noninteger_price) {Product.new(title: 'Title', description: 'desc', price: "uoi", quantity: 50)}
  let(:product_with_noninteger_qty) {Product.new(title: 'Title', description: 'desc', price: 55, quantity: "poi")}

  describe 'validations' do
    context 'will raise an error' do
      it 'when the title is missing' do
        product_no_title.save
        expect(product_no_title.errors[:title]).to include("can't be blank")
      end
      it 'when the description is missing' do
        product_no_desc.save
        expect(product_no_desc.errors[:description]).to include("can't be blank")
      end
      it 'when the price is missing' do
        product_no_price.save
        expect(product_no_price.errors[:price]).to include("can't be blank")
      end
      it 'when the qty is missing' do
        product_no_qty.save
        expect(product_no_qty.errors[:quantity]).to include("can't be blank")
      end
      it 'when the quantity is not an integer' do
        product_with_noninteger_qty.save
        expect(product_with_noninteger_qty.errors[:quantity]).to include("is not a number")
      end
    end
    context 'it will successfully save when' do
      it 'saves when all fields are present' do
        expect{good_product.save}.to change{Product.count}.by(1)
      end
    end
  end
end
