class PizzasController < ApplicationController
    resources :pizzas, only: [:index]
end
