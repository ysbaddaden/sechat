module Sechat
  module Models # :nodoc:
    module Question
      extend ActiveSupport::Concern

      included do
        has_many :answers, :order => :created_at, :dependent => :delete_all
        
        scope :answered,   where(:answered => true)
        scope :unanswered, where(:answered => false)
      end
    end
  end
end
