require 'twitter'
require 'pry'
require 'pp'

class TweetMassager
  attr_reader :mins, :client, :container, :start_time, :raw_tweets

  def initialize(attributes)
    @mins = attributes[:mins]
    @client = attributes[:client]
    @container = Hash.new(0)
  end

  def generate
    set_start_time
    process_in_background
  end

  def top_tweets
    @raw_tweets = @container.sort{|a,b| a[1] <=> b[1]}.last(10)
    format_tweets
  end

  private

  def process_in_background
    a = Thread.new do
      @client.sample do |object|
        Thread.kill(a) if time_is_up?
        @container[object.text] += 1 if object.is_a?(Twitter::Tweet)
      end
    end
  end

  def set_start_time
    @start_time = Time.now
  end

  def time_is_up?
    Time.now - @start_time > @mins * 60
  end

  def format_tweets
    @raw_tweets.inject({}) do |memo, value|
      memo[value[1]] ||= []
      memo[value[1]] << value[0]
      memo
    end
  end

end

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "#"
  config.consumer_secret     = "#"
  config.access_token        = "#"
  config.access_token_secret = "#"
end

mins = 1
massager = TweetMassager.new(:mins => mins, :client => client)
massager.generate
(mins * 60).times do
  sleep(1)
  puts "------------- Top Ten Tweets From #{massager.start_time} To #{Time.now} ---------------"
  pp massager.top_tweets
end
