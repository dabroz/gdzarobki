Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :entries, only: %i[new create]

  root to: 'stats#stats'
end
