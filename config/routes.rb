Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

    # user routes

    get "/dashboard", to: "users#dashboard", as: "dashboard"
    patch "/dashboard", to: "users#update"
    get "/edit", to: "users#edit", as: "edit_profile"
    get "/meal_events/:meal_id/attendees/:user_id/request_contact", to: "users#request_contact", as: "resquest_contact"

    # user_interest routes

    get "/interests", to: "user_interests#edit", as: "interests"
    patch "/interests", to: "user_interests#update"

    # user_cuisines routes

    get "/new_cuisine", to: "user_cuisines#new", as: "new_cuisine"
    post "/cuisines", to: "user_cuisines#create"
    delete "/cuisines/:id", to:"user_cuisines#destroy"

    # meal_availabilities routes

    get "/calendar", to: "meal_availabilities#index", as: "calendar"
    post "/calendar", to: "meal_availabilities#create"
    delete "/calendar/:id", to: "meal_availabilities#destroy"

    # user_contacts routes

    patch "/contacts", to: "user_contacts#update"
    delete "/contacts/:id", to: "user_contacts#destroy"
    post "/contacts", to: "user_contacts#create"

    # meal_events routes

    get "/meal_events/:id/attendees", to: "meal_events#attendee_list", as: "attendee_list"
end
