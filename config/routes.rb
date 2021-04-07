Rails.application.routes.draw do
  # devise_for :users, ActiveAdmin::Devise.config
  devise_for :users, :controllers => {:registrations => 'registrations', :sessions => 'sessions'}

  #get 'projects/index'
  get "/projects", to: "projects#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_out', :to => 'active_admin/devise/sessions#destroy'
  end
  ActiveAdmin.routes(self)
  root to: "projects#index"
  resources :projects
end
