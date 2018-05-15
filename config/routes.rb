Rails.application.routes.draw do
  get 'dashboard/index'
  resources :transactions
  resources :ratios
  resources :ammounts
  resources :currencies do
    member do
        post 'buy', to: 'currencies#buy'
        get 'open_modal', to: 'currencies#open_modal'
    end
    collection do
        get 'get_currency_data', to: 'currencies#get_currency_data'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #root 'sessions#create'
  root to: 'dashboard#index'

  get '/welcome' => 'welcome#new'

  get '/signup' => 'users#new'
  post '/signup' => 'users#create'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
end
