Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'
    
  get '/ppe', to: 'person_pet_experiment#ppe'
  post "ppe" => "person_pet_experiment#create"
  get '/show', to: 'person_pet_experiment#show'
  
  get '/welcome', to: 'welcome#index'
  get '/stats', to: 'stats#index'
  
end
