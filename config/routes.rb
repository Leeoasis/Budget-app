Rails.application.routes.draw do
  root 'splash#splash'

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :categories, only: %i[index new create] do
    resources :records, only: %i[index new create]
  end
end
