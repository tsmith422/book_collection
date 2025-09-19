Rails.application.routes.draw do
  devise_for :admins
  resources :user_books
  resources :users
  root "books#index"

  resources :books do
    member do
      get 'delete'
    end
  end

end
