# frozen_string_literal: true
require 'sidekiq/web'

Rails.application.routes.draw do
  mount Sidekiq::Web => '/sidekiq'

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

      # resources :car_filters, only: %i[index show], param: :filter

      resources :dealers, only: %i[show] do
        get :reservations

        member do
          get :cars
        end

        collection do
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
      end

      namespace :admin do
        resources :users, only: %i[index create show update destroy]

        resources :reservations, only: %i[index show]

        resources :dealer_cars, only: %i[index create show update destroy]

        resources :cars, only: %i[index show update destroy]
      end

      resources :signup, only: %i[create]
      resources :session, only: %i[create]
      resources :refresh, only: %i[create]
    end
  end
end
