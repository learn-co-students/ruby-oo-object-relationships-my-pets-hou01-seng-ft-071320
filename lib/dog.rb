class Dog
  attr_reader :name
  attr_accessor :mood, :owner
  @@all = []

    def initialize(name,owner_obj)
    @name = name
    @owner = owner_obj
    @mood = "nervous"
    @@all << self
    end

    def self.all
      @@all
    end
end