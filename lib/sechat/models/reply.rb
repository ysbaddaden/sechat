module Sechat
  module Models # :nodoc:
    module Reply
      extend ActiveSupport::Concern

      included do
        belongs_to :question, :counter_cache => true
        validates_presence_of :question_id, :body
        
        after_save :set_question_answered, :if => :answer_changed?
      end

      def set_question_answered
        question.answered = answer || self.class.where(:question_id => question_id, :answer => true).any?
        question.save
      end
    end
  end
end
