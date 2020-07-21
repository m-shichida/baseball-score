Rails.application.routes.draw do
  resources :players, only: %i[index create]
  resources :teams,   only: %i[index create]
end
