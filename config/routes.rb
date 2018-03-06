Rails.application.routes.draw do

  namespace :api do
      namespace :v1 do
        resources :vehicles, except: [:new]
        resources :makes, except: [:new]
        resources :models, except: [:new]
      end
    end

end
