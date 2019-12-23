# frozen_string_literal: true

require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/api/sidekiq'

  namespace :api do
    namespace :v1 do
      resources :dealer_cars, only: %i[index show destroy] do
        member do
          post :book
        end

        collection do
          delete :destroy_list
        end
      end



      resources :dealers, only: %i[show update] do
        get :reservations

        member do
          get :cars
          get :statistics
          get :reservations

          post :upload_xml
        end
      end


      namespace :filters do
        resources :marks, only: %i[index] do
          resources :models, only: %i[index] do
            resources :modifications, only: %i[index] do
            end

            resources :complectations, only: %i[index] do
            end
          end
        end

        resources :dealer_cars, only: :index

        resources :extra_options, only: :index

        resources :dealers, only: :index do
          collection do
            get :regions
          end
        end

        resources :dealer_groups, only: :index do
          member do
            get :dealers
          end
        end

        resources :default, only: :index

        resources :regions, only: :index do
          member do
            get :cities
          end
        end

        resources :cities, only: :index
      end


      resources :current_user, only: :index

      resources :current_location, only: %i[index show]


      namespace :admin do
        resources :users, only: %i[index create show update destroy]

        resources :reservations, only: %i[index show]

        resources :dealer_cars, only: %i[index create show update destroy]

        resources :cars, only: %i[index show create update destroy]

        resources :dealers, only: %i[index show create update destroy]

        resources :statistics, only: %i[index]

        resources :dealer_groups, only: %i[index show create update destroy]

        resources :default_filters, only: %i[index show create update destroy]
      end

      resources :signup, only: %i[create]
      resources :session, only: %i[create]
      resources :refresh, only: %i[create]
    end
  end
end
