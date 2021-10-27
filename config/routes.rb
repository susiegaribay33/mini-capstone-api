Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/all_products", controller: "products", action: "products_all"
  get "/products" => "products#index"
  get "/products/:id" => "products#show"
  patch "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "suppliers#index"

  post "/users" => "users#create"

  post "/sessions" => "sessions#create"

  post "/orders" => "orders#create"
  get "/orders" => "orders#index"
  get "/orders/:id" => "orders#show"

end
