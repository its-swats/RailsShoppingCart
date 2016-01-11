class Cart < ActiveRecord::Base
  has_many :line_items
  belongs_to :user

  def total_cost
    total = 0
    self.line_items.each do |item|
      total += item.product.price
    end
    total
  end

end
