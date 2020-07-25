Rails.application.routes.draw do
  root 'team_scores#index'

  resources :team_scores, only: %i[index]
  resources :players, only: %i[index create update destroy]
  resources :teams,   only: %i[index create update destroy]
end
