Rails.application.routes.draw do
  get 'users/:username', to: 'users#show', as: 'user'

  resources :items
  resources :user_comments
  resources :tweets
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :users
  as :user do
  	get "signin" => "devise/sessions#new"
  	delete "signout" => "devise/sessions#destroy"
  	get "signup" => "devise/registrations#new"
  end
  root 'pages#home'
  get 'about' => 'pages#about'
  get 'contactus' => 'pages#contactus'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
