class AnswersController < Sechat::AnswersController
  respond_to :html, :except => [:index, :show]
  respond_to :xml
end
