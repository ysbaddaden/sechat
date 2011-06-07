module ActionDispatch # :nodoc:
  module Routing # :nodoc:
    class Mapper
      def sechat
        resources :questions do
          get :unanswered, :on => :collection
          resources :answers
        end
      end
    end
  end
end

