require 'twitter'
require 'pry'
require 'pp'

class Streamer
  attr_reader :client, :background_thread, :mins, :container

  def initialize(attributes)
    @client = attributes[:client]
    @mins = attributes[:mins]
    @container = attributes[:container]
  end

  def stream
    @background_thread = Thread.new do
      @client.sample do |object|
        if object.is_a?(Twitter::Tweet)
          @container[object.created_at] ||= []
          @container[object.created_at] << object.text
        end
        # Container will only keep tweets which are 5 mins up to date
        @container.keep_if {|time, tweet| @mins * 60 > Time.now - time}
      end
    end
  end

  def stop
    Thread.kill(@background_thread)
  end
end

class Massager
  attr_reader :raw_tweets, :top_tweets, :container

  def initialize(attributes)
    @container = attributes[:container]
  end

  def top_tweets
    build
    sort
    format
  end

  private

  def build
    @raw_tweets = Hash.new(0)
    @container.values.flatten.each do |tweet|
      @raw_tweets[tweet] += 1
    end
  end

  def sort
    @raw_tweets = @raw_tweets.sort{|a,b| a[1] <=> b[1]}.last(10)
  end

  def format
    @raw_tweets.inject({}) do |memo, value|
      memo[value[1]] ||= []
      memo[value[1]] << value[0]
      memo
    end
  end
end

class Manager
  attr_reader :container, :streamer, :massager

  def initialize(attributes)
    @container = {}
    @streamer = Streamer.new(container: @container, mins: attributes[:mins], client: attributes[:client])
    @massager = Massager.new(container: @container)
  end
end

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "nQ9u564TBJ2So7GDNilMT2Yt8"
  config.consumer_secret     = "SyjO1C42NEX9wa6G17QcWNA51IVkormbKN1o9uv4xIyFmMlmpV"
  config.access_token        = "2479343976-NYQb08cXgJZfnNUNIB2JlqHccBorugIwEQsGdR8"
  config.access_token_secret = "S416VIez76F7QbjSP78leXsFImpLFyImnwedtdzamHooY"
end

mins = 1
manager = Manager.new(mins: mins, client: client)
manager.streamer.stream

start_time = Time.now
loop do
  window_start = Time.now - start_time > 60*mins ? Time.now - 60*mins : start_time
  sleep(1)
  puts "------------- Top Ten Tweets from #{window_start} To #{Time.now} ---------------"
  pp manager.massager.top_tweets
end
