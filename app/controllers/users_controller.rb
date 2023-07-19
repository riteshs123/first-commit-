class UsersController < ApplicationController
	skip_before_action :authenticate_request, only: [:create, :login]
	before_action :user_find, only: [:destroy, :update]
	
	def index
		if params[:user_type].present?
			@users = User.where('lower(user_type) LIKE ?', "%#{params[:user_type].downcase}%")
		else
			@users = User.all
		end
		render json: paginate_collection(@users)
	end

	def create
		@user = User.new(user_params)
		if @user.save
			render json: @user, status: :created
		else
			render json: { error: @user.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		begin
			@user.destroy
			render json: { message: 'user deleted successfully' },status: :ok
		rescue
			render json: { message: 'Id not found' }, status: :not_found
		end
	end

	def login
		@user = User.find_by(email: params[:email], password: params[:password])
		if @user
			token = jwt_encode(user_id: @user.id)
			render json: { token: token }, status: :ok
		else
			render json: { errors: 'Invalid email password' }, staus:	:unauthorized
		end
	end

	def update
		if @user && @user.update(update_params)
			render json: @user, status: :ok
		else
			render json: { message: "User not found or unable to update" }, status: :not_found
		end
	rescue
		render json: { message: "not found" }, status: :not_found
	end

	private

	def user_find
		@user = User.find_by(id: params[:id])
	end

	def user_params
		params.permit(:user_type, :name, :email, :password)
	end

	def update_params
		params.permit(:name, :password)
	end

end
