class RestaurantsController < ApplicationController

	before_action :check_owner, only: [:create, :update, :destroy]
	before_action :check_restaurant_presence, only: [:update, :destroy]

	def index
		if params[:name].present?
			@restaurants = Restaurant.where('lower(name) LIKE ?', "%#{params[:name].downcase}%")
		else
			@restaurants = Restaurant.all 
		end
		render json: paginate_collection(@restaurants)
	end

	def create
		restaurant = @current_user.restaurants.new(restaurant_params)
		if restaurant.save
			render json: restaurant, status: :created
		else
			render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def update
		if @restaurant.update(update_restaurant)
			render json: @restaurant
		else
			render json: { errors: restaurant.errors.full_messages }, status: :unprocessable_entity
		end
	rescue
		render json: {message: "Not found"}, status: :not_found
	end

	def destroy
		begin
			@restaurant.destroy
			render json: { message: 'dishes deleted successfully' },status: :ok
		rescue
			render json: { message: 'Id not found' }, status: :not_found
		end
	end

	def status_restaurant
		if params[:status].present?
			@status = Restaurant.where("status LIKE '%#{params[:status]}%'")
		else
			@status = Restaurant.where(status: 'open')
		end
		render json: paginate_collection(@status)
	end

	private

	def restaurant_params
		params.permit(:name, :status, :image)
	end

	def update_restaurant
		params.permit(:name, :status, :image)
	end
	
end
