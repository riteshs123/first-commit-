class CategoriesController < ApplicationController

	def index
		if params[:name].present?
			@categories = Category.where('lower(name) LIKE ?', "%#{params[:name].downcase}%")
		else
			@categories = Category.all
		end
		render json: paginate_collection(@categories)
	end

end
