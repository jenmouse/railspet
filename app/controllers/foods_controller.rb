class FoodsController < ApplicationController
    
    def new
        @pet = Pet.find(params[:pet_id])
        @food = Food.new
    end
    
    def create
        @pet = Pet.find(params[:pet_id])
        @food = @pet.foods.new(food_params)
        
        if @food.save
            redirect_to @pet
        else
            render 'new'
        end
    end
    
    def food_params
    params.require(:food).permit(:name, :calories)
    end
end
        