class Owner

  attr_reader :name, :species 

  @@all = []

  def initialize(name, species = "human")
    @name = name 
    @species = species
    save 
  end

  def self.count
    self.all.count
  end

  def self.all 
    @@all
  end

  def save 
    self.class.all << self 
  end

  def say_species
    return "I am a #{species}."
  end


  def self.reset_all 
    self.all.clear
  end

  def cats 
    Cat.all.select {|i| i.owner == self}
  end

  def dogs
    Dog.all.select {|i| i.owner == self}
  end

  def buy_cat(cat)
   Cat.new(cat, self)  
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.collect {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.collect {|i| i.mood = "happy"}
  end

  
  def sell_pets
    self.cats.each {|i| i.mood = "nervous"}
    self.dogs.each {|i| i.mood = "nervous"}
    self.cats.each {|i| i.owner = nil}
    self.dogs.each {|i| i.owner = nil}
  end

  def list_pets 
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end