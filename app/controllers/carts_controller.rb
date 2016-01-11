class CartsController < ApplicationController

  def index
    @cart = current_user.cart
    # @line_item = current_user.cart.line_items
    @line_item = current_user.cart.line_items.group_by {|x| x.product_id}
  end


  def destroy
    current_user.empty_cart(current_user.id)
    redirect_to root_path
  end

end
