RailsApp::Application.routes.draw do
  sechat
  root :to => redirect("/questions")
end
