require 'rails_helper'

RSpec.feature "Products", type: :feature do
  #In regards to FactoryGirl, look in spec_helper.rb line 27, where we've created a Module called RSpecHelpers.  There we made a method called create that forwards to FactoryGirl.create (essentially creating an alias where we can just use 'create' in any rspec file) Also not that in line 35, we actually use the delegate method which does more or less the same thing
  let!(:product) { create(:product) }
  let!(:user) { create(:user) }

  describe 'product list', js: true do
    it 'shows an item on the product list' do
      visit products_path
      expect(page).to have_content(product.title)
    end

    context 'when logged in' do
      before{ login_as(user) }

      it 'shows the add product button if logged in as an admin' do
        click_on 'List'
        expect(page).to have_content('Add Product')
      end

      it 'allows an admin to create a product' do
        click_on 'List'
        click_on 'Add Product'
        fill_in 'Title', with: 'Bloop!'
        fill_in 'Description', with: 'Beep bop boop!'
        fill_in 'Price', with: '500.00'
        fill_in 'Quantity', with: '9001'
        click_on 'Create Product'
        expect(page).to have_content('Bloop!')
      end

    end

  end
end
