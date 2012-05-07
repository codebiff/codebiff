Codebiff::Application.routes.draw do

  resources :posts

  root :to              => 'posts#index'
  
  match "/feed"         => "pages#feed"
  
  match "/about"        => "pages#about"
  match "/archive"      => "pages#archive"
  match "/contact"      => "pages#contact"
  
  match "/login"        => "pages#login"
  match "/signin"       => "pages#signin"
  match "/logout"       => "pages#logout"
  
  match "/tag/:tag"     => "posts#tag"
  
  match "/:slug"        => "posts#slug"
  
end
