Rails.application.routes.draw do
  resource :fundraising_events, only: [:create]
end
