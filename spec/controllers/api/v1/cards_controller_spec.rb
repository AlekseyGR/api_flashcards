require 'rails_helper'
require 'shared_examples/shared_examples_api'
require 'shared_examples/shared_context_api'

module ApiFlashcards
  describe Api::V1::CardsController, type: :controller do
    routes { ApiFlashcards::Engine.routes }

    describe '#index' do
      before(:each) { get :index }

      context 'without credentials' do
        it_behaves_like 'not autorized'
      end

      context 'with wrong credentials' do
        before(:each) do
          get :index, request.headers['Authorization'] = 'some@test.com, wrong_password'
        end
        it_behaves_like 'not autorized'
      end

      context 'with correct credentials' do
        include_context 'correct credentials'

        it 'returns 200' do
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
