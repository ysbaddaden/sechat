module ActionDispatch # :nodoc:
  module Routing # :nodoc:
    class Mapper
      def sechat
        resources :questions do
          get :unanswered, :on => :collection
          
          resources :replies do
            put :answer, :on => :member
          end
        end
      end
    end
  end
end

