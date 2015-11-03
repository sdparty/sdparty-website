Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  devise_for :users, :controllers => { omniauth_callbacks: "admin/omniauth_callbacks", sessions: "admin/sessions" }
  root  'static_pages#home'
  match '/about',        to: 'static_pages#about',        via: 'get'
  match '/donate',       to: 'static_pages#donate',       via: 'get'
  match '/fundraising',  to: 'static_pages#fundraising',  via: 'get'
  match '/join',         to: 'static_pages#join',         via: 'get'
  match '/party_vote',   to: 'static_pages#party_vote',   via: 'get'
  match "/programs",     to: 'static_pages#programs',     via: 'get'
  match "/programs/1",   to: 'static_pages#programs_1',   via: 'get'
  match "/programs/2",   to: 'static_pages#programs_2',   via: 'get'
  match "/programs/3",   to: 'static_pages#programs_3',   via: 'get'
  match "/policies",     to: 'static_pages#policies',     via: 'get'
  match "/policies/1",   to: 'static_pages#policies_1',   via: 'get'
  match "/policies/2",   to: 'static_pages#policies_2',   via: 'get'
  match "/policies/3",   to: 'static_pages#policies_3',   via: 'get'
  match "/policies/4",   to: 'static_pages#policies_4',   via: 'get'
  match "/policies/5",   to: 'static_pages#policies_5',   via: 'get'
  match "/policies/6",   to: 'static_pages#policies_6',   via: 'get'
  match "/constitution", to: 'static_pages#constitution', via: 'get'
  match "/constructing", to: 'static_pages#constructing', via: 'get'
  match "/sitemap.xml",  to: 'static_pages#sitemap',      format: 'xml', via: 'get'

  resources :candidates, only: [:index, :show] do
    member do
      get :donate
    end
    collection do
      get :proportional
    end
  end
  match '/articles/presses',     to: 'articles#presses',      via: 'get', as: 'articles_presses'
  match '/articles/activities',  to: 'articles#activities',   via: 'get', as: 'articles_activities'
  match '/articles/issues',      to: 'articles#issues',       via: 'get', as: 'articles_issues'
  resources :articles, only: [:index, :show]

  namespace :admin do
    #match 'update_banners',  to: 'banners#update_banners',  via: 'put'
    #match 'update_issues',   to: 'issues#update_issues',    via: 'put'
    resources :articles
    resources :users, only: [:index, :update]
    resources :banners, except: [:show] do
      put :sort, on: :collection
    end
    resources :issues, except: [:show] do
      put :sort, on: :collection
    end
  end

  match "/404" => "errors#error404", via: [ :get, :post, :patch, :delete ], as: 'not_found'
  match "/422" => "errors#error422", via: [ :get, :post, :patch, :delete ]
  match "/500" => "errors#error500", via: [ :get, :post, :patch, :delete ]

  get 'about.html', to: redirect('/about')
  get 'candidate00.html', to: redirect('/candidates')
  get 'candidate01.html', to: redirect('/candidates/1')
  get 'candidate02.html', to: redirect('/candidates/2')
  get 'candidate03.html', to: redirect('/candidates/3')
  get 'candidate04.html', to: redirect('/candidates/4')
  get 'constructed.html', to: redirect('/constructing')
  get 'donation.html', to: redirect('/donate')
  get 'index.html', to: redirect('/')
  get 'join01.html', to: redirect('/join')
  get 'politics00.html', to: redirect('/policies')
  get 'politics01.html', to: redirect('/policies/1')
  get 'politics02.html', to: redirect('/policies/2')
  get 'politics03.html', to: redirect('/policies/3')
  get 'politics04.html', to: redirect('/policies/4')
  get 'politics05.html', to: redirect('/policies/5')
  get 'politics06.html', to: redirect('/policies/6')
  get 'principle00.html', to: redirect('/programs')
  get 'principle01.html', to: redirect('/programs/1')
  get 'principle02.html', to: redirect('/programs/2')
  get 'principle03.html', to: redirect('/programs/3')
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
