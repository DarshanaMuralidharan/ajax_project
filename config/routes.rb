Rails.application.routes.draw do
  devise_for :users
  resources :movies
  root 'movies#index'
  get '/create_review/:movie_id', to:'review#review_new' , as:'review_create'
  post '/movie/:movie_id/review', to:'review#create', as:'movie_review'
  get '/movie/:movie_id/reviews/:id/edit', to:'review#edit_review', as:'edit_review'
  patch '/movie/:movie_id/reviews/:id', to: 'review#update', as: 'update_review'

end