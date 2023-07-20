class DishesController < ApplicationController

	before_action :check_owner, only: [:create, :update, :destroy]
	before_action :check_restaurant_presence, only: [:create, :update, :destroy]
	before_action :find_dish, only: [:update, :destroy]

	def index
		if params[:name].present?
			@dishes = Restaurant.includes(:dishes).where(dishes: {name: "#{params[:name]}"})
		else
			@dishes = Dish.all
		end
		render json: paginate_collection(@dishes)
	end    

	def create
		dish = @restaurant.dishes.new(dish_params)
		if dish.save
			render json: dish, status: :created
		else
			render json: { message: "Not found" }, status: :not_found
		end
	end

	def update
		if @dish.update(update_params)
			render json: @dish, status: :ok
		else
			render json: { error: @dish.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		if @dish
			@dish.destroy
			render json: { message: 'Dish deleted successfully' }, status: :ok
		else
			render json: { message: 'Dish not found' },status: :not_found
		end
	end

	private

	def find_dish
		@dish = Dish.find_by(id: params[:dish_id], restaurant_id: @restaurant.id)
		raise unless @dish.present?
	rescue
		render json: {message: "Not found "}, status: :not_found
	end

	def dish_params
		params.permit(:name, :price, :category_id, :user_id, :restaurant_id, :image)
	end
	
	def update_params
		params.permit(:name, :price, :image)
	end
	
end
