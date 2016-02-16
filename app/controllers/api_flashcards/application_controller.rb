module ApiFlashcards
  class ApplicationController < ActionController::Base
    http_basic_authenticate_with name: 'user', password: 'password'
  end
end
