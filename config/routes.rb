Rails.application.routes.draw do
  root 'home#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'post/:id' => 'posts#show'
  post 'post' => 'posts#create'
  delete 'post/:id' => 'posts#destroy'
  post 'follow/:id' => 'follows#create'
  delete 'follow/:id' => 'follows#destroy'
  get ':username/followings' => 'users#followings'
  get ':username/followers' => 'users#followers'
  get ':username/edit' => 'users#edit'
  get ':username' => 'users#show'
  patch ':username' => 'users#update'

  get '*path', to: 'application#render_404'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
