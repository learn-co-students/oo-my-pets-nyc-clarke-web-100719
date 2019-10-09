class Owner
  # code goes here

  @@all = []
  @@count = 0

  attr_reader :name, :species, :cats, :dogs

  def initialize(name)
  
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
    @cats = []
    @dogs = []
    
  end
  
  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    @@count
  end

  def self.reset_all
    @@all.clear
    @@count = 0
  end



  def buy_cat(name)
  
    cat = Cat.new(name, self)
    #@cats << cat 

  end

  def buy_dog(name)

    dog = Dog.new(name, self)
    #@dogs << dog

  end

  def change_mood(pet, mood)

    pet.each { |pet|
      pet.mood = mood
    }

  end

  def orphanate(pet)
  
    pet.each { |pet| 
    
      pet.owner = nil

    }
    pet.clear
    
  end



  def walk_dogs
    change_mood(@dogs, "happy")
  end

  def feed_cats
    change_mood(@cats, "happy")
  end

  def sell_pets
    change_mood(@dogs, "nervous")
    change_mood(@cats, "nervous")
    orphanate(@dogs)
    orphanate(@cats) 
  end

  def list_pets
  
    "I have #{@dogs.count} dog(s), and #{@cats.count} cat(s)."

  end


end