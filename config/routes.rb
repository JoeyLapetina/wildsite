Wildsite::Application.routes.draw do

  resources :scrapebots


  resources :favorites

  resources :submissions
  
  resources :words

  resources :streams do 
    member do
      get :bump
      get :send_left
      get :send_right
    end

    collection do 
      post :lights_on
      post :lights_off 
    end
  end

  resources :stream_items do 
    member do
      get :hide
    end 
  end
  
  devise_for :users

  
   match 'wildstar' => 'streams#index', :defaults => { filter: 'wildstar' }, as: 'wildstar_streams'
   match 'tera' => 'streams#index', :defaults => { filter: 'tera' }, as: 'tera_streams'
   match 'teso' => 'streams#index', :defaults => { filter: 'teso' }, as: 'teso_streams'
   match 'eso' => 'streams#index', :defaults => { filter: 'eso' }, as: 'eso_streams'
   match 'neverwinter' => 'streams#index', :defaults => { filter: 'neverwinter' }, as: 'neverwinter_streams'
   match 'all' => 'streams#index', :defaults => { filter: 'all' }, as: 'all_streams'
   match 'show/:filter/:category' => 'streams#index', :as => :categories
   match 'wildstar/jb_says_top/' => 'streams#index', :defaults => { filter: 'wildstar', category: 'jb_says_top' }
   match 'wildstar/joey_says_bottom/' => 'streams#index', :defaults => { filter: 'wildstar', category: 'joey_says_bottom' }
   match ':user/likes/:stream' => 'favorites#make', as: 'make_favorite'
   match ':user/unlike/:stream' => 'favorites#unmake', as: 'unmake_favorite'
   match 's/:id' => 'streams#show', as: 'short'
   match 'ScrapeBot9000' => 'scrapebots#show', :defaults => { id: 1 }, as: 'ScrapeBot9000'


   

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'streams#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
