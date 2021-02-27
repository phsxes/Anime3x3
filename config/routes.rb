# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

Rails.application.routes.draw do
  root to: "main#index"
  get 'search', to: 'search#find'
  get 'select', to: 'main#select'
end
