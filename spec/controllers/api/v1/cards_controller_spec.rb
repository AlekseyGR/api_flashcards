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
        # let(:user) { FactoryGirl.create(:user) }
        # let(:block) { FactoryGirl.create(:block) }
        # let(:card) { FactoryGirl.create(:card) }
        # before do
        #   get :index, request.headers['Authorization'] = ActionController::HttpAuthentication::Basic.encode_credentials(user.email, user.password)
        # end
        it 'returns 200' do
          # p ''
          # p '*' * 120
          # p "user = #{user.inspect}"
          # p response.headers
          # p "request.headers = #{ request.headers['Authorization'].inspect }"
          # p ''
          # p '*' * 120

          expect(response.status).to eq(200)
        end
      end
    end
  end
end
