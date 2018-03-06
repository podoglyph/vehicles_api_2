Rails.application.routes.draw do

  namespace :api do
      namespace :v1 do
        resources :vehicles, except: [:new]
      end
    end

end
