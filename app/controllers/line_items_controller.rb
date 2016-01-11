class LineItemsController < ApplicationController

  def create
    if request.xhr?
      params[:total_quantity].to_i.times do
        current_user.cart.line_items.create(product_id: params[:product_id])
      end
      @data = "Cart: (#{current_user.cart.line_items.count})"
      respond_to do |format| 
        format.js {render text: @data}
      end
      # render :"layouts/_navbar", layout: false
    else
      status 400
    end
  end

  def destroy
    @line_item = LineItem.find(params[:id]).destroy
    redirect_to carts_path
  end

end
