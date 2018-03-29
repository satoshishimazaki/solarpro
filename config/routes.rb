Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'inquiries#new'
  # get '/signup_path', to: 'inquiry#new' 
  resources :inquiries, only: [:create, :edit]
  post "/" => "inquiries#new"
  # get "/thank" => "inquiries#create"
  # get "inquiries/thank" => "inquiries#thank"
end
