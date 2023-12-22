Rails.application.routes.draw do
  root 'searches#index'
  
  resources :searches, only: [:index, :create] do
    collection do
      get :autocomplete
    end
  end  
  get "up" => "rails/health#show", as: :rails_health_check

end
