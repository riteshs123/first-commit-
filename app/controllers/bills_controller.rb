class BillsController < ApplicationController

	def create
		bill = create_bill(params[:cart_id])
		return render json: { message: "Failed to create bill" }, status: :unprocessable_entity unless bill.save
		render json: bill
	end

	private

	def create_bill(cart_id)
		select_dish = SelectDishForCart.where(cart_id: cart_id)
		total_amount = 0
		dishes, restaurants = [], []

		select_dish.each do |select_dish|
			restaurant = Restaurant.find(select_dish.restaurant_id) 
			dish = restaurant.dishes.find(select_dish.dish_id)
			total_amount += dish.price
			dishes << dish.id
			restaurants << restaurant.id
		end
		select_dish.destroy_all
		bill = Bill.create(user_id: @current_user.id, cart_id: cart_id, dishes: dishes, restaurants: restaurants, total_amount: total_amount)
	end

end
