class ExercisesController < ApplicationController
    
    def new
        @pet = Pet.find(params[:pet_id])
        @exercise = Exercise.new
    end
    
    def create
        @pet = Pet.find(params[:pet_id])
        @exercise = @pet.exercises.new(exercise_params)
        
        if @exercise.save
            redirect_to @pet
        else
            render 'new'
        end
    end
    
    def exercise_params
    params.require(:exercise).permit(:name, :calories)
    end
end