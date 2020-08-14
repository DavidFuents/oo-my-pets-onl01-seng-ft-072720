class Owner
 attr_reader :name, :species
 
 @@all = []
 
  def initialize(name)
   @name = name
   @species = "human"
   @@all << self
  end
   
  def say_species
    "I am a #{species}."
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self}
  end
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self}
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end
  
  def buy_dog(name)
    Dog.new(name, self)
  end
  
  def walk_dogs
    Dog.all.each {|dog| dog.mood = "happy"}
  end
  
  def feed_cats 
    Cat.all.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    cats.each do |cat|
      cat.owner = nil 
      cat.mood = "nervous"
    end
    dogs.each do |dog|
      dog.owner = nil 
      dog.mood = "nervous"
    end
  end
  
  def list_pets
    "I have #{@owner.dogs.count} dog(s), and #{@owner.cats.count} cat(s)."
    
  def self.all 
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear
  end
end