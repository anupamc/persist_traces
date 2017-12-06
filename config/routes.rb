Rails.application.routes.draw do
	resources :traces do
		get 'show_all', on: :collection
	end
end
