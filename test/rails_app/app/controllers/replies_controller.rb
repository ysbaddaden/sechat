class RepliesController < Sechat::RepliesController
  respond_to :html, :except => [:index, :show]
  respond_to :xml
end
