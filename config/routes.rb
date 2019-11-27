# frozen_string_literal: true

Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cars, only: %i[show] do
        member do
          post :book
        end
      end

      namespace :cars do
        resources :list, only: %i[index show destroy], param: :dealer_id
        resources :filters, only: %i[index]
        resources :upload, only: %i[create]
      end

      resources :dealers, only: %i[show] do
        get :reservations
      end

      namespace :admin do
        resources :users, only: %i[index create update destroy]

        resources :register, only: %i[create]
      end

      resources :login, only: %i[create]
      resources :refresh, only: %i[create]
    end
  end
end
