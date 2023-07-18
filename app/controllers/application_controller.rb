class ApplicationController < ActionController::API

	include JsonWebToken

	before_action do
		ActiveStorage::Current.url_options = { protocol: request.protocol, host: request.host, port: request.port }
	end

	before_action :authenticate_request

	private

	def paginate_collection(collection, per_page: 10)
		collection.paginate(page: params[:page], per_page: per_page)
	end

	def check_customer
		unless @current_user.user_type.casecmp?('customer')
			render json: { message: 'You are not a customer' }
		end
	end

	def check_owner
		unless @current_user.user_type.casecmp?('owner')
			render json: { message: 'You are not the owner' }
		end
	end

	def check_restaurant_presence
		# byebug
		@restaurant = @current_user.restaurants.find_by(id: params[:id])
		unless @restaurant
			render json: { message: 'Restaurant Id not found' }, status: :not_found
		end
	end

	def authenticate_request
		header = request.headers['Authorization']
		header = header.split(' ').last if header
		decoded = jwt_decode(header)
		@current_user = User.find(decoded[:user_id])
	rescue StandardError
		render json: { error: 'User not authorized Token' }
	end
end
