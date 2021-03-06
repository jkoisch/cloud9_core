Rails.application.routes.draw do
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

  namespace :api do
    namespace :v1 do
  #     resources :products do
  #       resources :costs, shallow: true
  #       resources :prices, shallow: true
  #     end
  #     resources :product_types
  #     resources :costs
  #     resources :prices
  #     resources :invoices
  #     resources :components
      resources :systems do
        collection do
          post 'measurement'
        end
      end
  #     resources :opportunities
  #     resources :customers do
  #       resources :components, shallow: true
  #       resources :measurements, shallow: true
  #       resources :invoices, shallow: true
  #     end

    end
  end

  resources :salesforce do
    collection do
      get 'salesforce_callback'
    end
  end

  resources :systems
  resources :customers do
    member do
      get :simulate_invoice
      get :create_invoice
      get :component
    end
  end
  resources :products do
    member do
      get :costs
      get :prices
    end
  end
  resources :invoices do
    member do
      get :check
      get :pay
      patch :settle
    end
  end
  #root :to => 'dashboard#index'
  root to: 'home#index'
  # get '*path', to: 'home#index'
end
