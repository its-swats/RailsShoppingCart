require 'rails_helper'

RSpec.describe ProductsController, type: :controller do
  let(:logged_in_user) {FactoryGirl.create :user}

  describe "GET index" do
    it "assigns @products" do
      product = Product.create(title: "white wine", description: "refreshing", price: 25, quantity: 12)
      get :index
      expect(assigns(:products)).to eq([product])
    end

    it "renders the index template" do
      get :index
      expect(response).to render_template("index")
    end
  end
  describe "GET show" do
    it "renders the show page with selected item" do
      Product.create(title: "puppies", description: "refreshing", price: 25, quantity: 12)
      product = Product.find_by(title: "puppies")
      get :show, id: product
      expect(response).to render_template("show")
    end
  end
end

RSpec.describe Admin::ProductsController, type: :controller do
  let(:logged_in_user) {FactoryGirl.create :user}
   describe "GET new" do #focus this one right now
    it "renders the new form template" do
      session[:user_id] = logged_in_user.id
      get :new
      expect(response).to render_template("products/new")
    end
  end
  describe "GET edit" do
    it "renders the edit form template with selected item" do
      session[:user_id] = logged_in_user.id
      Product.create(title: "puppies", description: "refreshing", price: 25, quantity: 12)
      product = Product.find_by(title: "puppies")
      get :edit, id: product
      expect(response).to render_template("edit")
    end
  end
  describe 'UPDATE product' do
    it 'successfully updates an item' do
       product = Product.create(title: "puppies", description: "refreshing", price: 25, quantity: 12)
       product.update(title: 'updated_title')
       expect(product.title).to eq('updated_title')
      end
  end
  describe 'DELETE product' do
    it 'successfully deletes an item' do
      product = Product.create(title: "puppies", description: "refreshing", price: 25, quantity: 12)
      expect{product.destroy}.to change{Product.count}.by(-1)
    end
  end
  describe 'CREATE product' do
    it "creates a new product" do
      product = Product.new(title: 'very red wine', description: 'delcious', price: 75, quantity: 1)
      expect{product.save}.to change{Product.count}.by(1)
    end
  end
end
