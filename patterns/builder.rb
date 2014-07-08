class Computer
end

class CPU
end

class TurboCPU < CPU
end

class BasicCPU < CPU
end

class Motherboard
end

class Drive
end

class ComputerBuilder
  attr_reader :computer

  def initialize
    @computer = Computer.new
  end

  def turbo
    @computer.motherboard.cpu = TurboCPU.new
  end

  def display=(display)
    @computer.display = display
  end

  def memory_size(size_in_mb)
    @computer.motherboard.memory_size = size_in_mb
  end

  def add_cd(writer = false)
    @computer.drives << Drive.new(:cd, writer)
  end

  def add_dvd(writer = false)
    @computer.drives << Drive.new(:dvd, writer)
  end

  # Start over
  def reset
    @computer = Computer.new
  end
end
