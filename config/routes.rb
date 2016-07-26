Rails.application.routes.draw do
  resources :posts, only: [:index, :new, :create, :destroy]

	resources :welcome, only: [:home]
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#home'
end
