class Pet < ActiveRecord::Base
  mount_uploader :picture, PictureUploader

  has_many :foods
  has_many :exercises
  def age
    today = Date.current
    today.day - self.created_at.day
  end

  def eaten_foods
    self.foods.map{|food| food.name }.join(", ")
  end


  def exercises_done
    self.exercises.map{|exercise| exercise.name }.join(", ")
  end
  
  def food_score
    calories = []
    self.foods.map do |food|
      calories << food.calories
    end
    f_score = calories.sum(&:to_i)
    e_score = exercise_score
    
    (f_score - e_score)
  end
  
  def exercise_score
    calories = []
    self.exercises.map do |exercise|
      calories << exercise.calories
    end
    calories.sum(&:to_i)
  end
end
