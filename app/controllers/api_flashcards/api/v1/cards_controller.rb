module ApiFlashcards
  module Api
    module V1
      class CardsController < ApiFlashcards::ApplicationController
        def index
          render json: 'Test for cards', status: 200
        end

        def create

        end
      end
    end
  end
end
