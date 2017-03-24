Rails.application.routes.draw do

  namespace :v1 do
    get 'products/show'
    delete '/signout', to: 'sessions#destroy'
  end

  api_version(:module => "V1", :path => {:value => "v1"}, :default => true) do
    resources :password_resets,         only: [:edit, :create, :update]
    resources :account_activations,     only: [:edit]
    resources :users,                   only: [:show, :create, :update]
    resources :sessions,                only: [:create, :destroy]
    resources :orders,                  only: [:create]
    resources :products,                only: [:index, :show]
    resources :sexes,                   only: [:index]
    resources :categories,              only: [:index]
    resources :producers,               only: [:index]
    resources :bills,                   only: [:create, :show]
    resources :show_bills_details,       only: [:index, :create]
  end

  namespace :v1 do
	  resources :customers
	end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
