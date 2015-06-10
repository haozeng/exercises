require 'pry'
require 'pp'

@cache = []
@cache_two = {}

def climb_stairs(n)
  return 1 if n == 1
  return 2 if n == 2

  return @cache[n] if @cache[n]

  @cache[n] = climb_stairs(n-1) + climb_stairs(n-2)
  @cache[n]
end

def climb_stairs_two(n)
  return 0 if n == -1
  return 1 if n == 0
  return @cache_two[n] if @cache_two[n]

  @cache_two[n] = climb_stairs_two(n-1) + climb_stairs_two(n-2)
end

pp climb_stairs(4)
pp climb_stairs_two(4)

pp climb_stairs(9)
pp climb_stairs_two(9)
