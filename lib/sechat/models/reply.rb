module Sechat
  module Models # :nodoc:
    module Reply
      extend ActiveSupport::Concern

      included do
        belongs_to :question, :counter_cache => true
        attr_protected :question_id
        validates_presence_of :question_id, :body
        after_save :update_question_status, :if => :answer_changed?
      end

      # Updates the answered column of associated question. This is called
      # automatically on save if the answer status changed.
      def update_question_status
        question.answered = answer || self.class.where(:question_id => question_id, :answer => true).any?
        question.save
      end
    end
  end
end
