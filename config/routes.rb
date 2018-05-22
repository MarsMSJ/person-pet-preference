Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'welcome#index'    
  get '/welcome', to: 'welcome#index'
  get '/ppe', to: 'person_pet_experiment#ppe'
  post 'ppe', to: 'person_pet_experiment#create'
  get '/show', to: 'person_pet_experiment#show'
  get '/guessvalidation', to: 'person_pet_experiment#guessvalidation'
  get '/goodbye', to: 'person_pet_experiment#goodbye'
  get '/welcome', to: 'welcome#index'
  get '/stats', to: 'stats#index'
  
  
  resources :ppe
end
