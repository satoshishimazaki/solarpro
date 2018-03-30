Rails.application.routes.draw do
  #static_pages 
  get 'company' => 'static_pages#company', as: :static_pages_company
  get 'privacy' => 'static_pages#privacy', as: :static_pages_privacy
  get 'agreement' => 'static_pages#agreement', as: :static_pages_agreement

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'inquiries#new'
  # get '/signup_path', to: 'inquiry#new' 
  resources :inquiries, only: [:create, :edit]
  post "/" => "inquiries#new"
  # get "/thank" => "inquiries#create"
  # get "inquiries/thank" => "inquiries#thank"
end
