ATM::Application.routes.draw do
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
  root :to => 'usuarios#mostrar_login'
  resources :caixas_eletronicos
  resources :usuarios
  resources :bem_vindos
  put 'mostrar_login', to: 'usuarios#mostrar_login', as: :mostrar_login
  post 'login',to: 'usuarios#login', as: :login  
  put 'abastecer', to: 'caixas_eletronicos#abasceter', as: :abastecer
  put 'mostrar', to: 'caixas_eletronicos#mostrar', as: :mostrar 
  post 'sacar', to: 'caixas_eletronicos#sacar', as: :sacar
  get 'mostrar_saque', to: 'caixas_eletronicos#mostrar_saque', as: :mostrar_saque
  get 'deslogar', to:'usuarios#deslogar', as: :deslogar
  get 'seguranca', to: 'usuarios#seguranca', as: :seguranca
  
 
  
   
  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
