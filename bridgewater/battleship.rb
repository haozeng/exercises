# The problem for the technical interview was how to go about designing
# a game of battleships. Questions that were asked included: how would
# you represent the ships on the board? how would you represent a hit
# on a ship? how would you know if a ship has sunk? how would you 
# know if the player's placement of ships on the board was legal?
# Is there a way to make your solution more user-friendly?


# The goal is to build a minimum viable prototype and
# refactor it gradually.


# Component:

# Map, ships, ship_length (which represents health)

# Idea:

# 1. A map (grid) where each side can place ships
# 2. A ship has certain length which can be displayed in the map,
#    In this case, let's assume the length is the strength of ship.
# 3. Assume the ship can hit anywhere in the map, if the ship is hit
#    At the place where it is located, let's replace it with some symbol
# 4. The winner is declared whenever the fleet is completely destroyed.


require 'pry'

# Set up 10x10 board
board = []

for i in 0..9
  board_row = []
  for j in 0..9
    board_row << -1
  end
  board << board_row
end

user_board = Marshal.load( Marshal.dump(board) )
comp_board = Marshal.load( Marshal.dump(board) )

ships = { "Aircraft Carrier" => 5,
          "Battleship" => 4, "Submarine" => 3,
          "Destroyer" => 3, "Patrol Boat" => 2 }

ship_blood = ships.dup

# User placing the ship
def user_place_ships(board, ships)
  ships.each do |name, length|
    valid = false

    while !valid
      print_board("u", board)
      puts "Place an/an " + name

      x, y = get_coor
      ori = v_or_h

      valid = validate(board, length, x, y, ori)

      if !valid
        puts "Cannot place a ship there. Please take a look at the board and retry again."
        puts "Hit ENTER to continue"
        gets.strip
      end
    end
    # place the ship
    board = place_ship(board, length, name[0], ori, x, y)
    puts '~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~'
    puts 'print out the battles in the field.'
    print_board("u", board)
  end

  puts "Done placing user ships. Hit ENTER to continue"
  gets.strip
  board
end

# Get coordinates of the ship
def get_coor
  while true
    puts 'Please enter coordinates (row).'
    row = gets.strip.to_i
    puts 'Please enter coordinates (col).'
    col = gets.strip.to_i

    # check if two values are integers between 1 and 10
    unless row.is_a?(Integer) && col.is_a?(Integer) &&
           row.between?(0, 9) && col.between?(0, 9)
      raise 'Invalid Coordinate. Please use value in between 0 and 10.'
    end

    # return coordinates if everything is ok
    return [row, col]
  end
end

# Get orientation of the ship
def v_or_h
  while true
    puts "Vertical or Horizontal (v,h) ?"
    direction = gets.strip
    if ['v', 'h'].include?(direction)
      return direction
    else
      puts "Invalid Input. Please only enter v or h."
    end
  end
end

# Validate the ship can be placed at given coordinates
def validate(board, ship_length, x, y, ori)
  if ori == 'v' and x + ship_length > 10
    return false
  elsif ori == 'h' and y + ship_length > 10
    return false
  else
    if ori == 'v'
      for i in 0..ship_length
        if board[x+i][y][0] != -1
          return false
        end
      end
    elsif ori == 'h'
      for j in 0..ship_length
        if board[x][y+j] != -1
          return false
        end
      end
    end
  end
end

# Place ship based on orientation
def place_ship(board, length, s, ori, x, y)
  if ori == 'v'
    for i in 0..length
      board[x+i][y] = s
    end
  elsif ori == 'h'
    for i in 0..length
      board[x][y+i] = s
    end
  end
  board
end

# Computer places the ship
def computer_places_ships(board, ships)
  ships.each do |name, length|
    # generate random coordinates and validate the position
    valid = false

    while !valid
      x = rand(9)
      y = rand(9)
      o = ['v', 'h'].sample

      valid = validate(board, length, x, y, o)
    end 

    # Place the ship
    board = place_ship(board, length, name[0], o, x, y)
    print_board("c", board)
  end

  board
end

# Get coordinates from the user and try to make move if move is a hit
# Check ship sunk and wink conditions.
def user_move(board)
  while true
    x, y = get_coor
    board = shared_move_logic(board, x, y)
    return board if !board.is_a?(String)
  end
end

def computer_move(board)
  while true
    x, y = rand(9), rand(9)
    board = shared_move_logic(board, x, y)
    return board if !board.is_a?(String)
  end
end

def shared_move_logic(board, x, y)
  res = make_move(board, x, y)
  if res == 'hit'
    puts "Hit at #{x+1}, #{y+1}"
    check_sink(board, x, y)
    board[x][y] = '$'
    if check_win(board)
      return 'WIN'
    end
  elsif res == 'miss'
    puts "Sorry, #{x+1}, #{y+1} is a miss."
    board[x][y] = '*'
  elsif res == 'try again'
    puts "Sorry, that coordinate was already hit. Please try again."
  end

  if res != 'try again'
    return board
  end
end

# make a move on the board and return the result, hit, miss or try again for repeat hit
def make_move(board, x, y)
  if board[x][y] == -1
    return "miss"
  elsif board[x][y] == '*' or board[x][y] == '$'
    return "try again"
  else
    return "hit"
  end
end

# figure out which ship was hit
def check_sink(board, x, y)
  if board[x][y] == 'A'
    ship = 'Aircraft Carrier'
  elsif board[x][y] == 'B'
    ship = 'Battleship'
  elsif board[x][y] == 'S'
    ship = 'Submarine'
  elsif board[x][y] == 'D'
    ship = 'Destroyer'
  elsif board[x][y] == 'P'
    ship = 'Patrol Boat'
  end

  ship_blood[ship] -= 1
  if ship_blood[ship] == 0
    puts "Ship #{ship} sunk."
  end
end

def check_win(board)
  for i in 0..9
    for j in 0..9
      if board[i][j] != -1 && board[i][j] != '*' && board[i][j] != '$'
        return false
      end
    end
  end
end

require 'matrix'

def print_board(player, board)
  m = Matrix[*board]
  m.to_a.each {|r| puts r.inspect}
end


user_place_ships(board, ships)
computer_places_ships(board, ships)

