module ApiFlashcards
  module Api
    module V1
      class CardsController < ApiFlashcards::ApiController
        def index
          @cards = current_user.cards.order(:review_date)
          render json: @cards, status: 200
        end

        def create

        end
      end
    end
  end
end
