Rails.application.routes.draw do
  root 'welcome#index'
  get "rebirth" => "users#edit"
  devise_for :users
  resources :posts
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
