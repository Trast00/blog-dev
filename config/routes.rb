Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get "/", to: "users#index" 
  get "/users", to: "users#index" 
  get "/users/:id", to: "users#show"
  
  get "/users/:id/posts", to: "posts#index"
  get "/users/:id/posts/new", to: "posts#new"
  post "/users/:id/posts/create", to: "posts#create"
  get "/users/:id/posts/:id_post", to: "posts#show"
  post "/users/:id/posts/:id_post/add_comment", to: "posts#add_comment", as: "add_comment"
  post "/users/:id/posts/:id_post/add_like", to: "posts#add_like", as: "add_like"
end
