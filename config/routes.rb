Funkyouseven::Application.routes.draw do
  devise_for :users

  post "markdown/preview"

  match '/size_to_product_count/:product_id/:size_id/:product_count', :to => 'size_to_products#size_to_product_count', :as => :size_to_product_count

  resources :posts

  match '/products/section/:section/sex/:sex', :to => "products#sex", :as => :products_by_sex
  match '/products/section/:section/career/:career', :to => "products#career", :as => :products_by_career
  match '/products/section/:section/page/:page', :to => "products#page", :as => :products_by_page
  match '/products/funk_yoo_shot' => "products#funk_yoo_shot", :via => :get
  resources :products

  match '/product_to_look/:product_id/:look_id/:yes', :to => 'product_to_looks#check'

  match '/basket/remove/:product_id/:size_id', :to => 'basket#remove_product', :as => :remove_from_basket
  match '/basket/add/:product_id/:size_id', :to => 'basket#add_product', :as => :add_to_basket
  match '/basket/update_size/:product_count/:product_id/:size_id', :to => 'basket#update_size', :as => :update_size
  match '/basket/empty', :to => 'basket#empty', :as => 'empty_basket', :as => :empty_basket
  match '/basket/:product_count/:product_id/:size_id', :to => 'basket#set_count', :as => :set_count
  match '/basket' => 'basket#my_basket', :as => :my_basket

  resources :orders


  resources :shop_sections
  resources :section_categories
  resources :brands

  match '/shop/not_publish' => 'products#not_publish', :as => :shop_not_publish
  match '/shop/archive' => 'products#archive', :as => :shop_archive
  match '/shop/import_catalog' => 'products#import_catalog', :as => :shop_import_catalog
  match '/shop/brands' => 'brands#index', :as => :shop_brands
  match '/shop/:shop_section' => 'products#index', :as => :shop_section_products
  match '/shop/:shop_section/:section_category' => 'products#index', :as => :section_category_products

  match '/product_images/crop/:id' => 'product_images#crop', :as => :crop_product_image
  #match '/product_images/process/:id' => 'product_images#crop', :as => :crop_product_image
  match '/product_images/update/:id/:cover/:preview/:title' => 'product_images#update'
  match '/product_images/destroy/:id' => 'product_images#destroy'
  match '/product_images/upload' => 'product_images#upload'
  resources :product_images

  match '/post_images/crop/:id' => 'post_images#crop', :as => :crop_post_image
  match '/post_images/update/:id/:cover/:preview/:title' => 'post_images#update'
  match '/post_images/destroy/:id' => 'post_images#destroy'
  match '/post_images/upload' => 'post_images#upload'
  resources :post_images

  match '/magazine' => 'posts#index'
  match '/magazine/:short_url' => 'posts#show', :as => :magazine_post

  match '/:short_url' => 'statics#show', :as => :show_static
  resources :statics

  resources :welcomes

  root :to => 'welcomes#home'

  match '/access_denied' => 'error#access_denied', :as => :access_denied
  match '/not_found' => 'error#not_found', :as => :not_found
end
