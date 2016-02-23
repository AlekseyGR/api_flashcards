ApiFlashcards::Engine.routes.draw do
  root 'home#welcome'

  namespace :api do
    namespace :v1 do
      get :cards, to: 'cards#index'
    end
  end
end
