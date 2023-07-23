Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :employees, only: [:index, :show, :create, :update] 
      resources :contacts, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
