#8.4

class ParkingLot 
  attr_reader :size, :spots, :availablility

  def initialize(size=100)
    @size = size
    @spots = Array.new(@size){|e| e}
    @availablility = @spots.inject({}) { |memo, element| memo.merge( element => true) }
  end

  def avaiable_spots
    @availablility.all? { |k, v| v == true }
  end

  def assign_spot
    key, value = @availablility.select{ |k, v| v == true }.first
    @availablility[key] = false
    { key => false }
  end

  def leave_spot
    
  end
end

class Car
  attr_reader :status, :location

  def initialize(status, parking_lot = ParkingLot.new)
    @status = status
    @parking_lot = parking_lot
  end

  def parked?
    @status == 'parked'
  end

  def park!
    @status = 'parked'
  end

  def park
    return if parked?
    @location = @parking_lot.assign_spot
    park!
  end
end

parking_lot = ParkingLot.new(10)
car = Car.new('not parked', parking_lot)
car.park
car.location

car2 = Car.new('not parked', parking_lot)
car2.park

puts parking_lot.availablility