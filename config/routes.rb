Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post '/login', to: 'authentication#login'

  post '/signup', to: 'authentication#signup'

  get '/profile/:user_id', to: 'profile#getuserdetails'

  put 'profile/:user_id', to: 'profile#edituser'

#  routes for articles 

  post '/article', to: 'article#createarticle' 

  get '/article', to: 'articleall#getarticles'

  get '/article/byuserid/:user_id', to: 'article#getarticlebyuserid'

  get 'article/byarticleid/:article_id', to: 'article#getarticlebyarticleid'

  put '/article/:id' , to: 'article#editarticle'

  get '/categories', to: 'category#get'

  delete 'article/:id', to: 'article#deletearticle'

  get 'authorfilter/:username', to: 'filter#authorfilter'
  
  get 'articlefilter/:title', to: 'filter#articlefilter'
  
  get 'categoryfilter/:category_name', to: 'filter#categoryfilter'
  
  post 'like/:user_id/:article_id', to: 'likes#post'

  post 'comment/:user_id/:article_id', to: 'comment#post'

  get 'comment/:article_id', to: 'comment#getcommentbyarticleid'

end
