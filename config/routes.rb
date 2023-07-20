Rails.application.routes.draw do

 resources :users, :restaurants, :categories, :dishes, :select_dish_to_carts, :bills
 post 'login', to: 'users#login'
 delete '/user', to: 'users#destroy'
 
 # resources :restaurants
 get '/rest', to: 'restaurants#status_restaurant'

 # resources :dishes
 get '/dish/:name', to: 'dishes#search'
 
 # resources :categories
 # get '/category', to: 'categories#search'
 
 # resources :select_dish_to_carts
 # resources :bills
 
end
