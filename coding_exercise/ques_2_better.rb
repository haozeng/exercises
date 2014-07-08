class VisitedCell
  
  attr_reader :cell, :direction, :current_x, :current_y
  DIRECTION = [:top, :right, :down, :left]

  def initialize(n, m)
    @cell = Matrix.build(n, m) { |row, col| false }
    # Facing right initially
    @direction_index = 1
    @direction = DIRECTION[@direction_index]
    # Start from 0,0 position
    @current_x = 1
    @current_y = 1
  end

  def change_direction
    @direction_index = @direction_index == 3 ? 0 : @direction_index += 1
    @direction = DIRECTION[@direction_index]
  end

  def forward
    @current_x += 1 if @direction == :right
    @current_y += 1 if @direction == :down
    @current_x -= 1 if @direction == :left
    @current_y -= 1 if @direction == :top
  end

  def start
    
  end

  def change_direction?
    @current_x > n || @current_y > n || visited?
  end

  def visited?
    @cell[@current_y]
  end
end
