Rails.application.routes.draw do

  devise_for :users
  devise_scope :user do
    get "/", :to => "devise/sessions#new"
  end
  root to: 'devise/sessions#new'
  
  resources :products

  resources :users
  
  resources :user_carts do
    collection do
    	get :add_to_cart
    	post :update_items
    	get :show_cart
      delete :clear_cart
    end
  end

end
