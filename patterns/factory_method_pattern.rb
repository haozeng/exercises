# Version One

class Duck
  def initialize(name)
    @name = name
  end

  def eat
    puts "Duck #{@name} is eating."
  end

  def speak
    puts "Duck #{@name} says Quack."
  end

  def eat
    puts "Duck #{@name} sleeps quietly."
  end
end

class Frog
  def initialize(name)
    @name = name
  end

  def eat
    puts "Frog #{@name} is eating."
  end

  def speak
    puts "Frog #{@name} says Croooooooaaaaak."
  end

  def eat
    puts "Frog #{@name} doesn't sleep; he croaks all night."
  end
end

class Pond
  def initialize(number_animals)
    @animals = []
    number_animals.times do |i|
      animal = new_animal("Animal #{i}")
      @animals << animal
    end
  end

  def simulate_one_day
    @animals.each{ |animal| animal.speak; animal.eat; animal.sleep }
  end
end

class DuckPond < Pond
  def new_animal(name)
    Duck.new(name)
  end
end

class FrogPond < Pond
  def new_animal(name)
    Frog.new(name)
  end
end


# Version Two

class Pond
  def initialize(number_animals, animal_class,
                 number_plants, plant_class)
    @animal_class = animal_class
    @plant_class = plant_class

    @animals = []
    number_animals.times do |i|
      animal = new_organism(:animal, "Animal #{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = new_organism(:plant, "Plant #{i}")
      @plants << plant
    end

    def simulate_on_day
      @plants.each { |plant| plant.grow }
      @animals.each { |animal| animal.grow }
    end

    def new_organism(type, name)
      if type == :animal
        @animal_class.new(name)
      elsif type == :plant
        @plant_class.new(name)
      else
        raise "Unknown organism type: #{type}"
      end
    end
  end
end


# Version three


class Pond
  def initialize(number_animals, number_plants, organism_factory)
    @organism_factory = organism_factory

    @animals = []
    number_animals.times do |i|
      animal = @organism_factory.new_animal("Animal #{i}")
      @animals << animal
    end

    @plants = []
    number_plants.times do |i|
      plant = @organism_factory.new_plant("Plant #{i}")
      @plants << plant
    end

    def simulate_on_day
      @plants.each { |plant| plant.grow }
      @animals.each { |animal| animal.grow }
    end
  end
end

class OrganismFactory
  def initialize(plant_class, animal_class)
    @plant_class = plant_class
    @animal_class = animal_class
  end

  def new_animal(name)
    @animal_class.new(name)
  end

  def new_plant(name)
    @plant_class.new(name)
  end
end
