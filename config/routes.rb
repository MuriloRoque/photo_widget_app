# frozen_string_literal: true

Rails.application.routes.draw do
  root 'static_pages#home'
  get '/search', to: 'static_pages#home'
end
