Picturesque::Application.routes.draw do
  namespace :api, defaults: {format: 'json'} do
  	namespace :v1 do
		resources :galleries
		resources :paintings
  	end
  end
  resources :galleries
		resources :paintings
		root :to => "galleries#index"
end
