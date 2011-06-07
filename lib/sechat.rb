require 'sechat/routes.rb'

module Sechat
  autoload :QuestionsController, 'sechat/controllers/questions_controller'
  autoload :AnswersController,   'sechat/controllers/answers_controller'

  module Models
    autoload :Question, 'sechat/models/question'
    autoload :Answer,   'sechat/models/answer'
  end
end
