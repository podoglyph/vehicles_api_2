Rails.application.routes.draw do

  namespace :api do
      namespace :v1 do

        namespace :vehicles do
          get '/:id/options', to: "options#index"
        end


        resources :vehicles, except: [:new]
        resources :makes, except: [:new]
        resources :models, except: [:new]
        resources :options, except: [:new]
      end
    end

end
