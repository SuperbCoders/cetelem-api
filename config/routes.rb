# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :dealer_cars, only: %i[index show] do
        member do
          post :book
        end
      end

      namespace :dealer_cars do
        resources :list, only: %i[index show destroy], param: :dealer_id
        resources :filters, only: %i[index]
        resources :upload, only: %i[create]
      end

      resources :dealers, only: %i[show] do
        get :reservations
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
