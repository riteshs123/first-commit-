class Dish < ApplicationRecord
	belongs_to :category
	belongs_to :restaurant
	has_many :select_dish_for_carts, dependent: :destroy

	has_one_attached :image

	validates :name, presence: true,
	format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: 'should not contain numbers & symbol' }
	validates :price, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
