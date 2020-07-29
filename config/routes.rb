Rails.application.routes.draw do
  root 'games#index'

  resources :players,       only: %i[index create update destroy]
  resources :teams,         only: %i[index create update destroy]
  resources :games,         only: %i[index new create edit update destroy]
  resources :player_scores do
    collection do
      get :batter_score
      get :pitcher_score
    end
  end
end
