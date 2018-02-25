Rails.application.routes.draw do
 
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users
  resources :products
  resources :posts 
  resources :charges
  resources :contacts, only: [:new, :create]
  root 'welcome#index'
  get 'welcome/about'
  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
