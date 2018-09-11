Rails.application.routes.draw do
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/most_popular', to: "reports#most_popular", as: :most_popular
  get '/view_1', to: "pages#view_1", as: :view_1
  get '/view_2', to: "pages#view_2", as: :view_2
end
