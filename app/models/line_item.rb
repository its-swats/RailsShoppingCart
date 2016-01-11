class LineItem < ActiveRecord::Base

validates :product_id, :cart_id, presence: true

  belongs_to :cart
  belongs_to :product
end
