Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root 'welcome#home'
  get 'contact', to: 'welcome#contact'

  resources :books

  #route for searching a book using search bar
  get 'search', to: 'books#search'

  #appropriate resource paths for authors create_table

  get 'authors/new', to: 'authors#new'
  get 'authors', to: 'authors#index'
  post 'authors', to: 'authors#create'
  delete 'authors.:id', to: 'authors#destroy'

  #mailer
  post 'contact', to: 'welcome#request_contact'
end
