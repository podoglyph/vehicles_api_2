Rails.application.routes.draw do

  namespace :api do
      namespace :v1 do

        namespace :vehicles do
          get '/find_all', to: "find#index"
          get '/:id/options', to: "options#index"
          get '/most_expensive', to: "most_expensive#index"
        end


        resources :vehicles, except: [:new]
        resources :makes, except: [:new]
        resources :models, except: [:new]
        resources :options, except: [:new]
      end
    end

end
