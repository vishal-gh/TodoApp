Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html


  namespace :api do
    namespace :v1 do   
      resources :todo_lists do
        resources :todo_items do
          member do
            post :complete
            post :incomplete
            post :move
            patch :edit
          end
        end
      end
    end
  end



  get 'search/index'
  post 'search/index'

  
end
