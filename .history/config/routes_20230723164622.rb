Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do

      resources :employees, only: [:index, :show, :create, :update] do
        member do
          get 'contacts', to: 'contacts#contacts_by_employee'
        end
      end
      
      resources :contacts, only: [:index, :show, :create, :update, :destroy]
    end
  end
end
