class Product < ActiveRecord::Base
  has_many :line_items, dependent: :destroy
  validates :title, :description, :price, :quantity, presence: true
  validates :quantity, numericality: {only_integer: true}

end
