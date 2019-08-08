Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/team', to: 'static#team' 
  get '/contact', to: 'static#contact' 
  get '/welcom/:first_name', to:'static#welcom'
  get '/welcom/', to: 'static#welcom'
  get '/detaillegossip/:d', to:'static#detaille'
  get  '/:u', to:'static#utilisateur'

end
