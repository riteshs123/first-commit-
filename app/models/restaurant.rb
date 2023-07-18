class Restaurant < ApplicationRecord
	belongs_to :user
	has_many :dishes, dependent: :destroy
	has_many :select_dish_for_carts, dependent: :destroy

	has_one_attached :image

	validates :name, presence: true,
	format: { with: /\A[a-zA-Z]+(?: [a-zA-Z]+)?\z/, message: 'should not contain numbers & symbol' }
	validates :status, presence: true, inclusion: { in: %w[OPEN open close CLOSE] }

end
