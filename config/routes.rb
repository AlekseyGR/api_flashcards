ApiFlashcards::Engine.routes.draw do
  root 'home#welcome'

  scope module: 'api' do
    namespace :v1 do
      get :cards, to: 'cards#index'
      post :cards, to: 'cards#create'

      get :rewiew_card, to: 'review#review_card'
    end
  end
end
