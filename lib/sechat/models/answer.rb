module Sechat
  module Models # :nodoc:
    module Answer
      extend ActiveSupport::Concern

      included do
        belongs_to :question, :counter_cache => true
        validates_presence_of :question_id, :body
      end
    end
  end
end
