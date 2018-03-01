Rails.application.routes.draw do
  scope "(:locale)", locale: /#{I18n.available_locales.join("|")}/ do
  
    devise_for :admins
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

end
