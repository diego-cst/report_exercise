Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/most_popular', to: "searches#most_popular", as: :most_popular
  get '/devices_per_day', to: "searches#devices_per_day", as: :devices_per_day
  get '/view_1', to: "pages#view_1", as: :view_1
  get '/view_2', to: "pages#view_2", as: :view_2
end
