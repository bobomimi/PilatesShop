Rails.application.routes.draw do
  resources :posts
  get 'products/index'
  get 'products/reformer'

  resources :contacts, only: [:new, :create]
  root 'welcome#index'
  get 'welcome/about'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
