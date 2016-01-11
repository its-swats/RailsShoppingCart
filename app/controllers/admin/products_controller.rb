class Admin::ProductsController < ApplicationController
#admin-controller

  def index
    authorize Product, :admin_index?
    @products = Product.all

  end

  def new
    authorize Product, :admin_new?
    @product = Product.new
  end

  def edit
    authorize Product, :admin_edit?
    @product = Product.find(params[:id])
  end

  def create
    authorize Product, :admin_create?
    @product = Product.new(product_params)
    if @product.save
      redirect_to admin_products_path
    else
      render 'new'
    end
  end

  def show
    authorize Product, :admin_show?
    @product = Product.find(params[:id])
  end

  def update
    authorize Product, :admin_update?
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render 'edit'
    end
  end

  def destroy
    authorize Product, :admin_destroy?
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to admin_products_path
  end

  private
  def product_params
    # params[:product][:price] = convert_to_dollars(params[:product][:price])
    params.require(:product).permit(:title, :description, :quantity, :price)
  end

end
