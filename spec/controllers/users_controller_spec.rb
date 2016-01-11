require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:admin) {FactoryGirl.create :user}


  describe "GET user#index" do
    it "renders the page for an admin" do

      fake_users = [User.new, User.new, User.new]
      expect(User).to receive(:order).with(:last_name).and_return(fake_users)
      session[:user_id] = admin.id
      get :index
      expect(assigns[:users]).to eq fake_users
      expect(response).to have_rendered(:index)
    end

    # it "doesn't render the page for a non admin" do
    #                          #"undefined method `admin?' for nil:NilClass" also works in place of NoMethodError
    #   expect{get :index}.to raise_error(NoMethodError)
    # end
  end

  describe "GET user#new" do
    it 'renders a new user page' do
      get :new
      expect(response).to have_rendered(:new)
    end
  end

  describe "POST user#create" do
    it 'creates a new user' do
                        #must have curly braces! on the outside!
      unsaved_user_params = {:user => {:first_name => "first", :last_name => "last", :email => "email", :password => "aaaaaaaaa"}}
      expect{post :create, unsaved_user_params}.to change{User.count}.by(1)
    end
    it 'will not create a new user if params are missing' do
      unsaved_user_params = {:user => {:first_name => "first", :email => "email", :password => "aaaaaaaaa"}}
      expect{post :create, unsaved_user_params}.to change{User.count}.by(0)
    end
  end

  describe "GET user#show" do
    it 'renders a user display page' do
      get :show, id: admin
      expect(response).to have_rendered(:show)
    end
  end

  describe "GET user#edit" do
    it 'renders an edit page if the user is logged in' do
      session[:user_id] = admin.id
      get :edit, id: admin
      expect(response).to have_rendered(:edit)
    end

    it 'will not render an edit page if the user does not have access to that page' do
      expect{get :edit, id: admin}.to raise_error(NoMethodError)
    end
  end

  describe 'PUT user#update' do
    it 'updates user information when logged in' do
      session[:user_id] = admin.id
      put :update, id: admin.id, :user => {"first_name" => "JUPES", "password" => admin.password}
      admin.reload
      expect(admin.first_name).to eq('JUPES')
    end
  end

  describe 'DELETE user#delete' do
    it "deletes a user if logged in" do
       session[:user_id] = admin.id
       expect{delete :destroy, id: admin }.to change{User.count}.by(-1)
    end

    it "doesn't delete a user when not logged in" do
      expect{delete :destroy, id: admin }.to raise_error(NoMethodError)
    end
  end
end
