module ApiFlashcards
  module Api
    module V1
      class ReviewController < ApiFlashcards::ApiController
        def index
          if params[:id]
            @card = current_user.cards.find(params[:id])
          else
            @card = first_repeating_or_pending_card
          end

          render json: @card, status: :ok
        end

        def review_card
          @card = current_user.cards.find(params[:card_id])
          check_result = @card.check_translation(review_params[:user_translation])

          if check_result[:state]
            handle_correct_answer(check_result[:distance])
          else
            flash[:alert] = t(:incorrect_translation_alert)
            render json: { message: 'Incorrect answer' }, status: :ok
          end
        end

        private

        def review_params
          params.permit(:user_translation)
        end

        def first_repeating_or_pending_card
          if current_user.current_block
            current_user.current_block.cards.first_repeating_or_pending_card
          else
            current_user.cards.first_repeating_or_pending_card
          end
        end

        def handle_correct_answer(distance)
          if distance == 0
            render json: { message: 'Correct answer' }, status: :ok
          else
            render json: { message: "You entered translation from misprint. Please try again" }, status: :ok
          end
        end
      end
    end
  end
end
