YouthCamp::Application.routes.draw do

  get "sessions/create"
  get "welcome/index"
  get "registration/new"
  get "camper" => "registration#show", as: :camper
  # get "camper/:id" => "registration#edit", as: :camper_edit
  get "registration/edit"
  root 'welcome#index'
  get 'about' => 'welcome#about'
  get 'faq' => 'welcome#faq'
  get 'contact' => 'welcome#contact'
  get 'media' => 'welcome#media'
  get 'donate' => 'welcome#donate'
  post "sign_up" => 'registration#sign_up'
  get 'login' => 'sessions#new'
  post "register" => "registration#create"
  put 'update_details' => "registration#update"
  get 'print' => 'registration#print'
  match '/signout', to: 'sessions#destroy',  via: 'delete'
  resources :sessions, only: [:create]
  resources :registration

  get 'admin' => 'admin/admin#index'
  namespace :admin do
    resources :campers, except: [:create, :update, :destroy]
  end

  namespace :api do
    resources :campers do 
      collection do 
       post 'export'
       get 'download/:file_name' => 'campers#download_csv'
      end
    end
  end

  #  The priority is based upon order of creation: first created -> highest priority.
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
