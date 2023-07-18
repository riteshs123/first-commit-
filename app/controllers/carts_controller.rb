class CartsController < ApplicationController
	
	# before_action :check_customer, only: [:create, :destroy]

	# # def create
	# # 	if @current_user.cart.present?
	# # 		render json: { message: 'Cart already exists for the user' }, status: :created
	# # 	else
	# # 		cart = Cart.create(user_id:@current_user.id)
	# # 		render json: cart, status: :created
	# # 	end
	# # end

	# def destroy
	# 	cart  = @current_user.cart.find_by(params[:cart_id])
	# 	if cart.present?
	# 		cart.destroy
	# 		render json: {message: "Deleted Succesfuly"}, status: :ok
	# 	else
	# 		render json: {message: "You Have not cart"}
	# 	end
	# end
 
end
