class ProductsController < ApplicationController
#non-admin-controller


  def index
    @products = Product.all

  end

  def show
    @product = Product.find(params[:id])
  end

  # def new
  #   @product = Product.new
  #   authorize @product
  # end

  # def edit
  #   @product = Product.find(params[:id])
  #   authorize @product
  # end

  # def create
  #   @product = Product.new(product_params)
  #   authorize @product
  #   if @product.save
  #     redirect_to @product
  #   else
  #     render 'new'
  #   end
  # end



  # def update
  #   @product = Product.find(params[:id])
  #   authorize @product
  #   if @product.update(product_params)
  #     redirect_to @product
  #   else
  #     render 'edit'
  #   end
  # end

  # def destroy
  #   @product = Product.find(params[:id])
  #   authorize @product
  #   @product.destroy
  #   redirect_to products_path
  # end

  # private
  # def product_params
  #   # params[:product][:price] = convert_to_dollars(params[:product][:price])
  #   params.require(:product).permit(:title, :description, :quantity, :price)
  # end

end
