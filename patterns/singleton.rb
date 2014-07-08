class SimpleLogger
  @@instance = SimpleLogger.new

  def self.instance
    return @@instance
  end

  private_class_method :new

  attr_accessor :level

  ERROR = 1
  WARNING = 2
  INFO = 3

  def initialize
    @log = File.open('log.txt', 'w')
    @level = WARNING
  end

  def error(msg)
    @log.puts(msg)
    @log.flush
  end

  def warning(msg)
    @log.puts(msg) if @level >= WARNING
    @log.flush
  end

  def info(msg)
    @log.pus(msg) if @level >= INFO
    @log.flush
  end
end

require 'singleton'

class SimpleLogger
  include Singleton


end


