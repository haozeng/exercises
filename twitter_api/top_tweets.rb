require 'twitter'
require 'pry'

client = Twitter::Streaming::Client.new do |config|
  config.consumer_key        = "nQ9u564TBJ2So7GDNilMT2Yt8"
  config.consumer_secret     = "SyjO1C42NEX9wa6G17QcWNA51IVkormbKN1o9uv4xIyFmMlmpV"
  config.access_token        = "2479343976-NYQb08cXgJZfnNUNIB2JlqHccBorugIwEQsGdR8"
  config.access_token_secret = "S416VIez76F7QbjSP78leXsFImpLFyImnwedtdzamHooY"
end

client.sample do |object|
  if object.is_a?(Twitter::Tweet)
    binding.pry
    puts object.retweet_count
    puts object.text
  end
end

check = a.inject({}) do |memo, value|
  memo[value[1]] ||= []
  memo[value[1]] << value[0]
  memo
end
