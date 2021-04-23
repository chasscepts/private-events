Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  get 'sign_in', to: 'users#new_session'
  post 'sign_in', to: 'users#create_session'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
