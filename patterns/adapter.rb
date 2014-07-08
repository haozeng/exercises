class Renderer
  def render(text_object)
    text = text_object.text
    size = text_object.size_inches
    color = text_object.color
  end
end

class TextObject
  attr_reader :text, :size_inches, :color

  def initialize(text, size_inches, color)
    @text = text
    @size_inches = size_inches
    @color = color
  end
end

class BritishTextObject
  attr_reader :string, :size_mm, :colour
end

class BritishTextObjectAdapter < TextObject
  def initialize(bio)
    @bio = bio
  end

  def text
    @bio.string
  end

  def size_inches
    @bio.size_mm
  end

  def color
    @bio.colour
  end
end


Test = Class.new
test = Test.new

def test.hello
  puts 'hello'
end

test.instance_eval do
  def self.bye
    puts 'bye'
  end
end

test.instance_eval do
  method = proc { puts 'works' }
  self.class.send(:define_method, :not_working, &method)
end
