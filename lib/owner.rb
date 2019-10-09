class Owner
  # code goes here
  attr_reader :name, :species
  @@all =[]
  def initialize(name)
    @name = name
    @species = "human"
    self.class.all << self
  end 

  def say_species
    "I am a #{self.species}."
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    dogs.each{|dog| dog.mood = "happy"}
  end

  def feed_cats
    cats.each{|cat| cat.mood = "happy"}
  end

  def sell_pets
    cats.each{|cat|
      cat.mood = "nervous"
      cat.owner = nil
    }
    dogs.each{|dog|
    dog.mood = "nervous"
    dog.owner = nil
    }
  end

  def list_pets
    "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
  end
end