Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root 'static_pages#home'
  match '/about',       to: 'static_pages#about',      via: 'get'
  match '/donate',      to: 'static_pages#donate',     via: 'get'
  match '/join',        to: 'static_pages#join',       via: 'get'
  match "/sitemap.xml", to: 'static_pages#sitemap', format: 'xml', via: 'get'
  match "/programs",    to: 'static_pages#programs',   via: 'get'
  match "/program01",   to: 'static_pages#program01',  via: 'get'
  match "/program02",   to: 'static_pages#program02',  via: 'get'
  match "/program03",   to: 'static_pages#program03',  via: 'get'
  match "/policies",    to: 'static_pages#policies',   via: 'get'
  match "/policy01",    to: 'static_pages#policy01',   via: 'get'
  match "/policy02",    to: 'static_pages#policy02',   via: 'get'
  match "/policy03",    to: 'static_pages#policy03',   via: 'get'
  match "/policy04",    to: 'static_pages#policy04',   via: 'get'
  match "/policy05",    to: 'static_pages#policy05',   via: 'get'
  match "/policy06",    to: 'static_pages#policy06',   via: 'get'

  resources :issues, only: [:index, :show]
  resources :candidates, only: [:index, :show]
  match '/articles/presses',      to: 'articles#presses',      via: 'get', as: 'articles_presses'
  match '/articles/activities',   to: 'articles#activities',   via: 'get', as: 'articles_activities'
  resources :articles, only: [:index, :show]

  namespace :admin do
    match 'update_banners',    to: 'admin/banners#update_banners',    via: 'put'
    resources :articles
    resources :banners, except: [:show]
    resources :issues, except: [:show]
    resources :keywords

  end
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
