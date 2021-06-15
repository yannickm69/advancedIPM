Rails.application.routes.draw do
  root 'schedules#index'
  get '/schedules/index', to: "schedules#index"
  get '/timeleft', to: "schedules#timeleft"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
