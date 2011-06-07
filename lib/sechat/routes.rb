module ActionDispatch # :nodoc:
  module Routing # :nodoc:
    class Mapper
      def sechat
        resources :questions do
          resources :answers
        end
      end
    end
  end
end

