require 'rails_helper'
require 'shared_examples/shared_examples_api'
require 'shared_examples/shared_context_api'

module ApiFlashcards
  describe Api::V1::ReviewController, type: :controller do
    routes { ApiFlashcards::Engine.routes }

    describe "#index" do
      context "without credentials" do
        before(:each) { get :index }
        it_behaves_like 'not autorized'
      end

      context "with incorrect credentials" do
        before do
          get :index, request.headers["Authorization"] = 'some@test.com, wrong_password'
        end
        it_behaves_like "not autorized"
      end

    #   context "with correct credentials" do
    #     include_context "correct credentials" do
    #       let(:endpoint) do
    #         {
    #           verb: "get",
    #           method: "index"
    #         }
    #       end
    #     end
    #     it "responds with 200 status code" do
    #       expect(response.status).to eq(200)
    #     end
    #     it "responds with \'card_review\' key in response" do
    #       expect(json_response.key?("card_review")).to eq(true)
    #     end
    #     it "responds with only one card" do
    #       expect(json_response["card_review"]).not_to be_kind_of Array
    #     end

    #     %w(id original_text).each do |field|
    #       it "contains \'#{field}\' key inside \'card_review\'" do
    #         expect(json_response["card_review"].key?(field)).to eq(true)
    #       end
    #     end

    #     it "does NOT contain \'translated_text\' key inside \'card_review\'" do
    #       expect(json_response["card_review"].
    #         key?("translated_text")).to eq(false)
    #     end
    #   end
    end

  end
end
