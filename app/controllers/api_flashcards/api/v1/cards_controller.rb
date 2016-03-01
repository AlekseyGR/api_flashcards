module ApiFlashcards
  module Api
    module V1
      class CardsController < ApiFlashcards::ApiController
        def index
          @cards = current_user.cards.order(:review_date)
          render json: @cards, status: :ok
        end

        def create
          @card = current_user.cards.build(card_params)
          if @card.save
            render json: { message: 'success' }, status: :created
          else
            render json: { message: 'failed', errors: @card.errors }, status: :unprocessable_entity
          end
        end

        private

        def card_params
          params.require(:card).permit(:original_text, :translated_text, :block_id)
        end
      end
    end
  end
end
