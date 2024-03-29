Rails.application.routes.draw do



  # 顧客用
  # URL /customers/sign_in ...
  devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}




  # 管理者用
  # URL /admin/sign_in ...
  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}


scope module: :public do
 root to: "homes#top"



 get 'customers/my_page' => 'customers#my_page'

 post 'orders/check' => 'orders#check'
 get  'orders/complete' => 'orders#complete'
 resources :orders, only: [:index, :show, :new, :create]


  patch 'customers/change' => 'customers#change', as: 'change'

  resources :customers, only: [:update]
  patch 'customers/change' => 'customers#change'
  get 'customers/information/edit' => 'customers#edit'

  #退会機能
  get 'customers/withdrawal' => 'customers#withdrawal'

  get 'homes/top'
  get 'homes/about'
  get 'customers/my_page' => 'customers#my_page'
  post 'deliveries' => 'deliveries#create'
  get 'deliveries/index'
  get 'deliveries/edit'



 get 'homes/top'
 get 'homes/about'
 get 'customers/my_page' => 'customers#my_page'
 post 'deliveries' => 'deliveries#create'
 get 'deliveries/index'
 get 'deliveries/edit'
 resources :items, only: [:show, :index]
 delete 'cart_items/destroy_all' => 'cart_items#destroy_all', as: 'destroy_all'
 resources :cart_items, only: [:index, :create, :update, :destroy]


 resources :deliveries, only: [:index, :create, :edit, :update, :destroy]
# post 'deliveries' => 'deliveries#create'
# get 'deliveries/index'
# get 'deliveries/edit'
 get "search" => "searches#search"

end

 namespace :admin do
  get 'homes/top'


  resources :customers, only: [:edit, :update]
  get 'customers/my_page' => 'customers#my_page'

  resources :orders, only: [:show, :update]

  resources :order_details, only: [:update]

  resources :customers, only: [:index, :show, :edit, :update]


  resources :items, only: [:new, :index, :show, :create, :edit, :update]
  resources :genres, only: [:index, :create, :edit, :update]

end






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
