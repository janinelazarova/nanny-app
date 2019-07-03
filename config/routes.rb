Rails.application.routes.draw do
  # EXAMPLE HTML ROUTE
  # get "/photos" => "photos#index"

  # EXAMPLE JSON ROUTE WITH API NAMESPACE
  namespace :api do
    get "/nannies" => "nannies#index"
    post "/nannies" => "nannies#create"
    get "/nannies/:id" => "nannies#show"
    patch "/nannies/:id" => "nannies#update"
    delete "/nannies/:id" => "nannies#destroy"
    
    post "/nannies_sessions" => "nannies_sessions#create"
    post "/parents_sessions" => "parents_sessions#create"

    post "/parents" => "parents#create"
    get "/parents/:id" => "parents#show"
    patch "/parents/:id" => "parents#update"
    delete "/parents/:id" => "parents#destroy"

    get "/bookings" => "bookings#index"
    post "/bookings" => "bookings#create"
    get "/bookings/:id" => "bookings#show"
    patch "/bookings/:id" => "bookings#update"
    delete "/bookings/:id" => "bookings#destroy"

    get "/reviews" => "reviews#index"
    post "/reviews" => "reviews#create"
    get "/reviews/:id" => "reviews#show"
    patch "reviews/:id" => "reviews#update"
    delete "/reviews/:id" => "reviews#destroy"

  
  end

  # get "/bookings/new" => "bookings#new"
  # post "/bookings" => "bookings#create"


end
