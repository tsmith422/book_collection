Rails.application.routes.draw do
  resources :user_books
  resources :users
  root "user_books#index"

  resources :books do
    member do
      get 'delete'
    end
  end

end
