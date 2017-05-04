Rails.application.routes.draw do
  get 'bullet_in_board/index'

  get 'schedule/index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :schedules
end
