Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  devise_for :renters
  devise_for :agents
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root to: 'main#index',as: :main_index
get '/delimage/:id'=>"agent#delimage", as: :delimage
get '/unrent/:id' => 'properties#unrent' , as: :unrent
get '/remove/:id' => 'properties#remove' , as: :remove
get '/add_prop/:id' => 'properties#new', as: :addprop
get '/view_property/:id' => 'properties#show', as: :viewproperty
get '/display_prop', action: :show, controller: 'agent'
get '/view_prop', action: :show, controller: 'renter'
get '/add_approach/:id', action: :addapproach, controller: 'agent', as: :addapproach
get '/add_rented_prop/:id', action: :addrented, controller: 'properties', as: :addrentedprop
get '/add_wish_list/:id', action: :addwish, controller: 'properties', as: :addwishlist
get '/rented_listpath', action: :showrented, controller: 'properties', as: :rentedlistp
get '/wishlist_path', action: :showwish, controller: 'properties', as: :wishlistp
post '/reviews', action: :create, controller: 'review', as: :reviews
get '/del_image_attachment/:id', action: :delete_image_attachment, controller: :agent, method: :delete,as: :delimageattachment 
get '/view_approached_list/:id', action: :viewapproach, controller: 'agent',as: :viewapproach
post '/create', action: :create, controller: :company
get '/dashboard', action: :dashboard, controller: :main
get '/applied_list', action: :applied, controller: :renter
get '/add_sub_agents', action: :addagents,controller: :agent, as: :addagents
get '/view_sub_agents', action: :viewagents,controller: :agent, as: :viewagents
post '/agentcreate', action: :create, controller: :agent
resources :properties
resources :company
end
