RailsApp::Application.routes.draw do
  sechat
  root :to => "home#index"
end
