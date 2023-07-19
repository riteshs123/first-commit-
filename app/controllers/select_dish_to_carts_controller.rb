class SelectDishToCartsController < ApplicationController
	before_action :check_customer, only: [:create, :destroy]

	def create
		return cart = Cart.create(user_id:@current_user.id) unless @current_user.cart.present?
		@cart = @current_user.cart
		select_dish = @cart.select_dish_for_carts.new(select_params)
		if select_dish.save
			render json: select_dish, status: :created
		else
			render json: { message: "Failed to create select_dish_for_dish" }, status: :unprocessable_entity
		end
	end

	def destroy
		select_dish = SelectDishForCart.find_by(dish_id: params[:id])
		if select_dish.destroy!
			render json: { message: "Dish deleted successfully" }, status: :ok 
		end
	end

	private

	def select_params
		params.permit(:dish_id, :restaurant_id)
	end
	
end
