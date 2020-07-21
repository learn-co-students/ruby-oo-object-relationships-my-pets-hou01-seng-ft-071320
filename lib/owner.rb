require "pry"
class Owner
    attr_reader :name,:species
    attr_accessor 
    @@all=[]
    def initialize(name,species="human")
      @name = name
      @species =species
      @@all<<self
    end
    
    def say_species
      return "I am a #{self.species}."
    end
  
    def self.all
      @@all
    end
    
    def self.count
      @@all.size
    end
  
    def self.reset_all
      @@all.clear
    end
  
    def cats
      Cat.all.find_all{|value|
      value.owner==self}
    end
  
    def dogs
      Dog.all.find_all{|value|
      value.owner==self}
    end
    
    def buy_cat(name)
      new_cat=Cat.new(name,self)
    end
  
    def buy_dog(name)
      new_dog=Dog.new(name,self)
    end
  
    def walk_dogs
        self.dogs.each{|value|
        value.mood="happy"}  
    end
  
    def feed_cats
      self.cats.each{|value|
      value.mood="happy"}  
    end
    
    def sell_pets
      self.dogs.each{|value|
        value.mood="nervous"
        value.owner=nil}
      self.cats.each{|value|
        value.mood="nervous"
        value.owner=nil}
    end
  
    def list_pets
      return "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end
  
end
#binding.pry