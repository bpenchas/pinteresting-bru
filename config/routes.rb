Rails.application.routes.draw do
  devise_for :users

	resources :boards do
			member do
				resources :pins
			end
	end
	

		resources :pins do
			member do
				resources :boards
			end
		end

	#get '/pins/new/(:board_id)', to: 'pins#new', as: :new_pin
	

	root "boards#index"
end
