require 'pry'
class Owner
  attr_reader :name,:species
  attr_accessor :cats, :dogs
  
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
    @@all.count
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.find_all{|index| index.owner == self}
  end

  def dogs
    Dog.all.find_all{|index| index.owner == self}
  end

  def buy_cat(cat_name)
    self.cats = Cat.new(cat_name,self)
  end

  def buy_dog(dog_name)
    self.dogs = Dog.new(dog_name,self)
  end

  def walk_dogs
    Dog.all.each {|index| index.mood = "happy"}
  end

  def feed_cats
    Cat.all.each {|index| index.mood = "happy"}
  end

  def sell_pets
    Dog.all.each {|index| index.mood = "nervous"}
    Cat.all.each {|index| index.mood = "nervous"}
    Dog.all.each {|index| index.owner = nil}
    Cat.all.each {|index| index.owner = nil}
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end