Rails.application.routes.draw do
 devise_for :users

  # Define custom routes for CSV upload and export before 'resources :people'
  post 'people/upload_csv', to: 'people#upload_csv', as: :upload_csv_people
  get 'people/export', to: 'people#export_csv', as: :export_csv_people

  # Standard resourceful routes
  resources :people

  # Other routes
  root 'home#index'
  get 'home/about'


  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
