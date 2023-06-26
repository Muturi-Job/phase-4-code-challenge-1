class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :restaurantpizza_invalid
    
    def create
        restaurant = RestaurantPizza.create!(default_params)
        pizza = restaurant.pizza
        render json: pizza, status::created
    end

    private
    def default_params
        params.permit(:price, :pizza_id, :restaurant_id)
    end

    def restaurantpizza_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :unprocessable_entity
    end
end
