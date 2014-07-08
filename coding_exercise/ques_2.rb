class VisitedCell

  attr_accessor :n,:m,:moves,:pos_x,:pos_y,:cells_visited,:directions,:dir_index

  def initialize(n,m)
    if n < 1 or m < 1 
      raise "m and n has to be larger than 1"
    end
    @n = n
    @m = m
    @pos_x = 0
    @pos_y = 0
    @dir_index = 0
    @moves = 0
    @cells_visited = Array.new
    @directions = [:right, :down, :left, :top]
  end

  def move_forward
    @pos_x += 1 if @directions[@dir_index] == :right
    @pos_x -= 1 if @directions[@dir_index] == :left
    @pos_y -= 1 if @directions[@dir_index] == :top
    @pos_y += 1 if @directions[@dir_index] == :down
  end

  def move_backwards
    @pos_x -= 1 if @directions[@dir_index] == :right
    @pos_x += 1 if @directions[@dir_index] == :left
    @pos_y += 1 if @directions[@dir_index] == :top
    @pos_y -= 1 if @directions[@dir_index] == :down
  end

  def turn_right
    if @dir_index == 3
      @dir_index = 0
    else
      @dir_index += 1
    end
  end

  def visited?
    val = @cells_visited.select { |x| x == [@pos_x,@pos_y] }

    val.empty? ? false : true
  end

  def validate_move_forward
    move_forward
    if not_out_of_bound?
      move_backwards
      return true
    else
      move_backwards
      return false
    end
  end

  def not_out_of_bound?
    pos_x != n and pos_y != m and !visited? and pos_y >= 0 and pos_x >= 0
  end

  def add_visited
    @cells_visited.push([pos_x,pos_y])
  end

  def count
    fails_count = 0
    while fails_count != 4
      add_visited
      if validate_move_forward
        @moves += 1
        move_forward
        turn_right
        fails_count = 0
      else
        turn_right
        fails_count += 1
      end
    end

    puts @moves + 1
  end
end


n = Integer(gets)
m = Integer(gets)

VisitedCell.new(m,n).count
