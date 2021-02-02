# frozen_string_literal: true

Rails.application.routes.draw do
  resources :tasks do
    resources :points
  end
end
