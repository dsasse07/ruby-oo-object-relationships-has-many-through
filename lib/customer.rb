require 'pry'
require_relative 'meal'
require_relative 'waiter'

class Customer
    attr_accessor :name, :age

    @@all = []

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, cost, tip)
        Meal.new(waiter, self, cost, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.customer == self
        end
    end

    def waiters
        meals.map do |meal|
            meal.waiter
        end
    end 

end