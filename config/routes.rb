Funkyouseven::Application.routes.draw do
  #списки не опубликованных шмоток
  #скорость работы!!
  #срет в лог ФАВИКОН

  match '/size_to_product_count/:product_id/:size_id/:product_count', :to => 'size_to_products#size_to_product_count', :as => :size_to_product_count
  #resources :size_to_products

  resources :posts
  resources :products

  match '/basket/remove/:product_id/:size_id', :to => 'basket#remove_product', :as => :remove_from_basket
  match '/basket/add/:product_id/:size_id', :to => 'basket#add_product', :as => :add_to_basket
  match '/basket/empty', :to => 'basket#empty', :as => 'empty_basket', :as => :empty_basket
  match '/basket/:product_count/:product_id/:size_id', :to => 'basket#set_count', :as => :set_count
  match '/basket' => 'basket#my_basket', :as => :my_basket

  resources :orders

  devise_for :users

  resources :section_categories

  match '/shop/not_publish' => 'products#not_publish', :as => :shop_not_publish
  match '/shop/import_catalog' => 'products#import_catalog', :as => :shop_import_catalog
  match '/shop/brands' => 'brands#index', :as => :shop_brands
  match '/shop/:shop_section' => 'products#index', :as => :shop_section_products
  match '/shop/:shop_section/:section_category' => 'products#index', :as => :section_category_products
#  match '/shop/:short_url' => 'shop_sections#show'

  resources :shop_sections

  resources :brands

  match '/product_images/update/:id/:cover/:preview/:title' => 'product_images#update'
  match '/product_images/destroy/:id' => 'product_images#destroy'
  match '/product_images/upload' => 'product_images#upload'
  resources :product_images

  match '/post_images/update/:id/:cover/:preview/:title' => 'post_images#update'
  match '/post_images/destroy/:id' => 'post_images#destroy'
  match '/post_images/upload' => 'post_images#upload'
  resources :post_images

  match '/magazine' => 'posts#index'
  match '/magazine/:short_url' => 'posts#show', :as => :magazine_post

  match '/access_denied' => 'error#access_denied', :as => :access_denied
  match '/not_found' => 'error#not_found', :as => :not_found

  match '/:short_url' => 'statics#show'
  resources :statics
  resources :welcomes

  root :to => 'welcomes#home'

end
