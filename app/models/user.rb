class User < ActiveRecord::Base

  has_secure_password
  has_many :carts
  has_many :line_items, through: :carts
  validates :first_name, :last_name, :email, presence: true
  validates :password, :length => { :minimum => 5, allow_nil: true }

  def make_admin!
    update! admin?: true
  end

  def items_in_cart
    self.cart.line_items.count
  end

  def cart
    self.carts.first
  end

  def empty_cart(id)
    LineItem.destroy_all(:cart_id => id )
  end

end
