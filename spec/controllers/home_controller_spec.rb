require 'rails_helper'

module ApiFlashcards
  describe HomeController do
    routes { ApiFlashcards::Engine.routes }

    describe 'GET #welcome' do
      context 'no credentials' do
        before(:each) { get :welcome }

        it 'return status 401' do
          expect(response.status).to eq(401)
        end

        it 'return access denied response' do
          expect(response.body).to include('HTTP Basic: Access denied')
        end
      end

      context ' with wrong credentials' do
        before(:each) { get :welcome, request.headers['Authorization'] = 'wrong credentials' }

        it 'return status 401' do
          expect(response.status).to eq(401)
        end

        it 'return access denied response' do
          expect(response.body).to include('HTTP Basic: Access denied')
        end
      end

      context 'with correct credentials' do
        it 'returns 200 status code' do
          get :welcome, request.headers['Authorization'] = 'Basic dXNlcjpwYXNzd29yZA=='
          expect(response.status).to eq(200)
        end
      end
    end
  end
end
