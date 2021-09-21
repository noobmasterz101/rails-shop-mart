Rails.application.routes.draw do
  resources :coupons
  resources :items
  root 'welcome#index'
  get 'sign_up', to: 'registrations#new'
  post 'sign_up', to: 'registrations#create'
  get 'sign_in', to: 'sessions#new'
  post 'sign_in', to: 'sessions#create', as: 'log_in'
  delete 'logout', to: 'sessions#destroy'
  get 'password', to: 'passwords#edit', as: 'edit_password'
  patch 'password', to: 'passwords#update'
  get 'password/reset', to: 'password_resets#new'
  post 'password/reset', to: 'password_resets#create'
  get 'password/reset/edit', to: 'password_resets#edit'
  patch 'password/reset/edit', to: 'password_resets#update'

  # admin routes
  get 'ad_sign_up', to: 'admin_registrations#new'
  post 'ad_sign_up', to: 'admin_registrations#create'
  get 'ad_sign_in', to: 'admin_sessions#new'
  post 'ad_sign_in', to: 'admin_sessions#create', as: 'ad_log_in'
  delete 'ad_logout', to: 'admin_sessions#destroy'
  get 'ad_password', to: 'admin_passwords#edit', as: 'ad_edit_password'
  patch 'ad_password', to: 'admin_passwords#update'
  get 'ad_password/reset', to: 'admin_password_resets#new'
  post 'ad_password/reset', to: 'admin_password_resets#create'
  get 'ad_password/reset/edit', to: 'admin_password_resets#edit'
  patch 'ad_password/reset/edit', to: 'admin_password_resets#update'

  get 'ad_home', to: 'admin_home#index'
  get 'home', to: "home#index"
  post 'home', to: "home#add_to_cart"
  post 'home/incr', to: "home#incr"
  post 'home/decr', to: "home#decr"
  delete 'remove_from_cart', to: "home#remove_from_cart"
  post "place_order", to: "home#place_order"
  get "user/orders", to: "home#show_user_orders"
end