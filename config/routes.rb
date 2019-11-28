# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :dealer_cars, only: %i[index create show destroy] do
        member do
          post :book
        end

        collection do
          delete :destroy_list
          get :filters
        end
      end

      resources :dealers, only: %i[show] do
        get :reservations

        member do
          get :cars
        end

        collection do
          post :upload_xml
        end
      end

      namespace :admin do
        resources :users, only: %i[index create show update destroy]

        resources :reservations, only: %i[index show]

        resources :dealer_cars, only: %i[index create show update destroy]
      end

      resources :signup, only: %i[create]
      resources :session, only: %i[create]
      resources :refresh, only: %i[create]
    end
  end
end
