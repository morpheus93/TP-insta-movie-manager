Rails.application.routes.draw do

  devise_for :users

	root to: 'home#index'

	scope module: 'platform' do
		get 'movies/categories/:slug' => 'movie#get_categories', :as => 'platform_categories_movies'

		get 'search' => 'search#search', :as => 'platform_search_result'

		get 'connect' => 'user#login', :as => 'platform_login'

		get 'categories' => 'category#get_all', :as => 'platform_categories'

		get 'movies' => 'movie#get_all', :as => 'platform_movies'
		get 'movie/:slug' => 'movie#get_one', :as => 'platform_movie'

		post 'movie/:slug/comment' =>'movie#add_comment', :as => 'platform_add_comment'
	end

	scope module: 'admin' do

		# Movies management
		get 'admin/movies' => 'movies#index', :as => 'admin_movies'
		get 'admin/movies/new' => 'movies#new', :as => 'admin_new_movie'
		get 'admin/movies/:slug' => 'movies#edit', :as => 'admin_edit_movie'

		delete 'admin/movies/:slug' => 'movies#destroy', :as => 'admin_delete_movie'

		post 'admin/movies' => 'movies#create', :as => 'admin_add_movies'


		# Categories management

		get 'admin/categories' => 'categories#index', :as => 'admin_categories'
		get 'admin/category/new' => 'categories#new', :as => 'admin_new_category'
		get 'admin/category/:slug' => 'categories#edit', :as => 'admin_edit_category'

		delete 'admin/category/:slug' => 'categories#destroy', :as => 'admin_delete_category'

		post 'admin/categories' => 'categories#create', :as => 'admin_add_category'

	end

	# Example of regular route:
	#   get 'products/:id' => 'catalog#view'

	# Example of named route that can be invoked with purchase_url(id: product.id)
	#   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

	# Example resource route (maps HTTP verbs to controller actions automatically):
	#   resources :products

	# Example resource route with options:
	#   resources :products do
	#     member do
	#       get 'short'
	#       post 'toggle'
	#     end
	#
	#     collection do
	#       get 'sold'
	#     end
	#   end

	# Example resource route with sub-resources:
	#   resources :products do
	#     resources :comments, :sales
	#     resource :seller
	#   end

	# Example resource route with more complex sub-resources:
	#   resources :products do
	#     resources :comments
	#     resources :sales do
	#       get 'recent', on: :collection
	#     end
	#   end

	# Example resource route with concerns:
	#   concern :toggleable do
	#     post 'toggle'
	#   end
	#   resources :posts, concerns: :toggleable
	#   resources :photos, concerns: :toggleable

	# Example resource route within a namespace:
	#   namespace :admin do
	#     # Directs /admin/products/* to Admin::ProductsController
	#     # (app/controllers/admin/products_controller.rb)
	#     resources :products
	#   end
end
