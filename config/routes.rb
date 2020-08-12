Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :books do
    collection do
      get 'search'
    end
    member do
      get 'updateTitle'
    end
  end

  namespace :admin do
     resources :categories
     resources :articles do
       collection do
         get "test"
       end
     end

  end

end
