class RestaurantsController < ApplicationController
    resources :restaurants , only[:index, :show, :destroy]
    
end
