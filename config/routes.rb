# frozen_string_literal: true

Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_for :users
  get 'all_players_listing', to: 'users#all_players_listing'

  root to: "organisation_players#index", as: :organisation_root

  authenticated :user, ->(u) { u.player? } do
    root to: "users#show"
  end

  resources :organisations, only: %i[index]
  resources :organisation_players
  resources :users, only: %i[show]

end
