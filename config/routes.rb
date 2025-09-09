Rails.application.routes.draw do
  root "main#index"

  resources :books do
    member do
      get 'delete'
    end
  end

end
