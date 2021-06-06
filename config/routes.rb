Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :todo_lists do
    resources :todo_items do
      member do
        post :complete
        post :incomplete
        post :move
        get  :search
        patch :edit_new
      end
    end
  end

  get 'search/index'
  post 'search/index'

  root "todo_lists#index"
  
end