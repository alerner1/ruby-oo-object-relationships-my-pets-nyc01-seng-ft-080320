require 'pry'
require_relative 'cat.rb'
require_relative 'dog.rb'

class Owner
  attr_reader :name, :species
  @@all = []

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.count
  end

  def self.reset_all
    self.all.clear
  end

  def cats

    Cat.all.select do |cat|
      cat.owner == self
    end
  end

  def dogs
    Dog.all.select do |dog|
      dog.owner == self
    end
  end

  def find_cat_name(name) # returns object
    Cat.all.find do |cat|
      cat.name == name
     end
  end

  def find_dog_name(name) # returns object
    Cat.all.find do |cat|
      cat.name == name
    end
  end

  def buy_cat(name)
    cat_to_buy = find_cat_name(name)
    Cat.all.delete(cat_to_buy)
    cat_to_buy.owner = self
    Cat.all << cat_to_buy
  end

  def buy_dog(name)
    dog_to_buy = find_dog_name(name)
    Dog.all.delete(dog_to_buy)
    dog_to_buy.owner = self
    Dog.all << dog_to_buy
  end

  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
  end

  def list_pets
    
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end
