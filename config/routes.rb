Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :restaurants do
    # get '/restaurants/top', to: 'restaurants#top'
    collection do
      get :top
    end

    # get '/restaurants/:id/chef', to: 'restaurants#chef'
    member do
      get :chef
    end

    # NESTED: get 'restaurants/:restaurant_id/reviews/new', to: 'reviews#new'
    resources :reviews, only: [:new, :create]
  end


  # NOT NESTED : get 'reviews/:id/edit'
  resources :reviews, only: [:edit, :update, :destroy]
end
