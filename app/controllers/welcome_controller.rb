class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      redirect_to products_path
    else
      render 'index'
    end
  end
end
