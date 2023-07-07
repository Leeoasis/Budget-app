Rails.application.routes.draw do
  root 'splash#splash'

  devise_scope :user do
    get "/users/sign_out", to: "devise/sessions#destroy"
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }

  resources :categories, only: [:index, :new, :create] do
    resources :records, only: [:index, :new, :create]
  end
end
