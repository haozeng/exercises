require 'find'

class Expression
  def | (other)
    Or.new(self, other)
  end

  def & (other)
    And.new(self, other)
  end

  def all
    All.new
  end

  def bigger(size)
    Bigger.new(size)
  end

  def name(pattern)
    FileName.new(pattern)
  end

  def except(expression)
    Not.new(expression)
  end

  def writeable
    Writable.new
  end
end

class All < Expression
  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p
    end
    results
  end
end

class FileName < Expression
  def initialize(pattern)
    @pattern = pattern
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      name = File.basename(p)
      results << p if File.fnmatch(@pattern, name)
    end
    results
  end
end

class Bigger < Expression
  def initialize(pattern)
    @size = size
  end

  def evaluate(dir)
    results = []
    Find.find(dir) do |p|
      next unless File.file?(p)
      results << p if ( File.size(p) > @size )
    end
    results
  end
end


class Not < Expression
  def initialize(expression)
    @expression = expression
  end

  def evaluate(dir)
    All.new.evaluate(dir) - @expression.evaluate(dir)
  end
end
