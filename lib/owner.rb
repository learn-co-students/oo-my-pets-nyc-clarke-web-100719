require "pry"
class Owner
  attr_accessor :cats
  attr_reader :name
  @@all = []
  @@count = 0
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @@count += 1
    @cats = cats
  end
  

  def species
    @species
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
    @@count = 0
  end

  def cats
    Cat.all.select {|single_cat| single_cat.owner == self}
  end

  def dogs
    Dog.all.select {|single_cat| single_cat.owner == self}
  end

  def buy_cat(arg)
  Cat.new(arg,self)
   end

   def buy_dog(arg)
     Dog.new(arg, self)
   end
   
   def walk_dogs
     Dog.all.map do |element|
     element.mood = "happy"
     end
   end

   def feed_cats
     Cat.all.map {|element| element.mood = "happy"}
   end

   def sell_pets
   cats.each do |ele|
      ele.mood = "nervous"
    ele.owner = nil
   end
   dogs.each do |ele|
    ele.mood ="nervous"
    ele.owner = nil
   end
     end

     def list_pets
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
     end

  end