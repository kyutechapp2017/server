Rails.application.routes.draw do
  namespace :api do
    namespace :v3 do
      get 'bullet_in_boards/index'
    end
  end

  namespace :api do
    namespace :v3 do
      get 'schedules/index'
    end
  end

  get 'bullet_in_board/index'

  get 'schedule/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schedules
end
