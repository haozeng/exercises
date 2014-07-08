require 'twitter'
require 'pry'
require 'pp'

class TweetMassager
  attr_reader :mins, :client, :container, :raw_tweets, :background_thread

  def initialize(attributes)
    @mins = attributes[:mins]
    @client = attributes[:client]
    @container = {}
  end

  def generate
    process_in_background
  end

  def top_tweets
    build_raw_tweets_from_container
    sort_tweets_based_on_occurance
    format_tweets
  end

  def stop_streaming
    Thread.kill(@background_thread)
  end

  private

  def process_in_background
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

  def build_raw_tweets_from_container
    @raw_tweets = Hash.new(0)
    @container.values.flatten.each do |tweet|
      @raw_tweets[tweet] += 1
    end
  end

  def sort_tweets_based_on_occurance
    @raw_tweets = @raw_tweets.sort{|a,b| a[1] <=> b[1]}.last(10)
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
  config.consumer_key        = "nQ9u564TBJ2So7GDNilMT2Yt8"
  config.consumer_secret     = "SyjO1C42NEX9wa6G17QcWNA51IVkormbKN1o9uv4xIyFmMlmpV"
  config.access_token        = "2479343976-NYQb08cXgJZfnNUNIB2JlqHccBorugIwEQsGdR8"
  config.access_token_secret = "S416VIez76F7QbjSP78leXsFImpLFyImnwedtdzamHooY"
end

mins = 10
massager = TweetMassager.new(:mins => mins, :client => client)
massager.generate
(mins * 60).times do
  sleep(1)
  puts "------------- Top Ten Tweets From #{Time.now - mins * 60} To #{Time.now} ---------------"
  pp massager.top_tweets
end
