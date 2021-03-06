require 'pry'
require_relative 'meal'
require_relative 'customer'

class Waiter

    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, cost, tip)
        Meal.new(self, customer, cost, tip)
    end

    def meals
        Meal.all.select do |meal|
        meal.waiter == self #checking for waiter now
        end
    end 

    def best_tipper
        best_tipped_meal = meals.max do |meal_a, meal_b|
            meal_a.tip <=> meal_b.tip
        end
        best_tipped_meal.customer
    end
end 