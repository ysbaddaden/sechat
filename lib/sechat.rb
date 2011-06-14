require 'sechat/routes.rb'

module Sechat
  autoload :QuestionsController, 'sechat/controllers/questions_controller'
  autoload :RepliesController,   'sechat/controllers/replies_controller'

  module Models
    autoload :Question, 'sechat/models/question'
    autoload :Reply,   'sechat/models/reply'
  end
end
