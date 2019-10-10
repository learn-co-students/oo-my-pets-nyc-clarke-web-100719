class Cat
  attr_accessor :owner, :mood
  attr_reader :name
  
  @@all = []
  def initialize(name, owner)
    @name = name
    @mood = "nervous"
    @@all << self
    @owner = Owner.new(owner).name
  end

  def self.all
    @@all
  end

end