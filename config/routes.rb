Rails.application.routes.draw do
  namespace :api do
    namespace :v3 do
      get 'bulletinboards', to: 'bullet_in_boards#index'
    end
  end

  namespace :api do
    namespace :v3 do
      get 'schedules', to: 'schedules#index'
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schedules

  root 'subjects#index'
end
