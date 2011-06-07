module Sechat
  module Models # :nodoc:
    module Answer
      extend ActiveSupport::Concern

      included do
        belongs_to :question, :counter_cache => true
      end
    end
  end
end
