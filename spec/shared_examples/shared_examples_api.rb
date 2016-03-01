module ApiFlashcards
  shared_examples 'not autorized' do
    let(:not_autorized) { 'HTTP Basic: Access denied' }

    it 'return 401 status' do
      expect(response.status).to eq(401)
    end

    it 'return "Not autorized" in body' do
      expect(response.body).to include(not_autorized)
    end
  end

  shared_examples 'unprocesseble entity' do
    let(:params) { card_params }

    describe 'card' do
      it 'return 422 status code' do
        expect(response.status).to eq(422)
      end

      it 'return errors in body' do
        expect(response.body).to contain('errors')
      end

      it 'card not created' do
        expect(user.cards.count).to eq(1)
      end
    end
  end
end
