Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '(repos/:repo_id)/events', to: 'events#events'
  post 'authenticate', to: 'authentication#authenticate'
  
  resources :repos, only: [] do
  	resources :events, only: [:index]
  end

  resources :events, only: [:index, :show, :create]
end
