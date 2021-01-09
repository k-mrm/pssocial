Rails.application.routes.draw do
  root 'home#index'
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  get 'signup' => 'users#new'
  post 'signup' => 'users#create'
  get 'post/:id' => 'posts#show'
  post 'post' => 'posts#create'
  delete 'post' => 'posts#destroy'
  get ':username' => 'users#show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
