AllCheatsheets::Application.routes.draw do

  resources :cheatsheets
  resource :viewer , :controller => 'viewer'


  match "/auth/:provider/callback" => "sessions#create"
  match "/signout" => "sessions#destroy", :as => :signout


  match "/" => 'welcome#index' , :as => :home
end

