Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get "/all_products", controller: "products", action: "products_all"
  get "/products" => "products#index"
  get "/:id" => "products#show"
  patch "/products" => "products#create"
  patch "/products/:id" => "products#update"
  delete "/products/:id" => "products#destroy"

  get "/suppliers" => "suppliers#index"
end
