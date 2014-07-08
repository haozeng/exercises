class Vehicle
  VEHICLE_SIZE = {
                  :motorcyle => 'motorcyle', 
                  :compact   => 'compact', 
                  :large     =>  'large'  
                 }

  attr_accessor :license_plate, :spots_needed, :size

  def park_in_spot
  end

  def clear_spot
  end

  def car_fit_in_spot?
  end
end

class Bus < Vehicle
  def initialize
    @spots_needed = 5
    @size = Vehicle::VEHICLE_SIZE[:compact]
  end

  def car_fit_in_spot?
  end
end

class ParkingLot
  NUM_LEVELS = 5

  attr_reader :levels

  def build_level(level = Level.new)
    @levels << level
  end

  def park_vehicle(vehicle)
  end
end

class Level
  attr_reader :floor_number, :spot, :available_spots

  def initialize(floor_number, spot = Spot.new, available_spots)
    @floor_number = floor_number
    @spots = spot
    @available_spots = available_spots
  end

  def park_at_spots
  end

  def find_avaiable_spots
  end

  def free_spot
  end
end

class Spot
  attr_accessor :size, :number

  def initialize(size, number)
  end

  def park_vehicle
  end

  def get_spot_number
  end

  def remove_vehicle
  end
end














