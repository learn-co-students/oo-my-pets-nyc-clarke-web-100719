class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name, owner, mood = "nervous")
    @name = name
    @owner = owner
    @mood = mood
    self.save
  end

  def save
    self.class.all << self
  end

  def self.all
    @@all
  end 
end