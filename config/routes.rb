Rails.application.routes.draw do
  devise_for :users, path: 'users', controllers: { sessions: "users/sessions"}
  devise_for :admins, path: 'admins', controllers: { sessions: "admins/sessions"}
  mount Ckeditor::Engine => '/ckeditor'
  resources :products
  resources :posts 
  resources :charges
  resources :contacts, only: [:new, :create]
  root 'welcome#index'
  get 'welcome/about'
  get '*path' => redirect('/')
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
