Rails.application.routes.draw do
  root "products#index"
  # get "products" => "products#index"
  # get "products/:id" => "products#show", as: "product"
  # get "products/:id/edit" => "products#edit", as: "edit_product"
  # patch "products/:id" => "products#update"
  resources :products
end
