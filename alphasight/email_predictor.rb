require 'json'
require 'pry'
require 'pp'

class Pattern
  attr_reader :first_name, :last_name

  class << self
    def build(name)
      new *name.split(/[.|\s[1]]/)
    end
  end

  def initialize(first_name, last_name)
    @first_name, @last_name = first_name, last_name
  end

  def generate
    [first_part, last_part].join('_dot_').to_sym
  end

  def predict(rule)
    %w(first_initial first_name last_initial last_name).inject([]) do |memo, params|
      memo << send(params) if rule.to_s =~ /#{params}/
      memo
    end.join('.')
  end

  private

  def first_initial
    @first_name[0]
  end

  def last_initial
    @last_name[0]
  end

  def first_part
    @first_name.length == 1 ? 'first_initial' : 'first_name'
  end

  def last_part
    @last_name.length == 1 ? 'last_initial' : 'last_name'
  end
end

class Analyzer
  attr_reader :dataset

  def initialize
    @dataset = {}
  end

  def process(raw_data)
    raw_data.each_value do |email_address|
      name, email = email_address.split('@')
      pattern = Pattern.build(name)
      rule = pattern.generate
      @dataset[email] ||= []
      @dataset[email] << rule unless @dataset[email].include?(rule)
    end
  end
end

class Predictor
  attr_reader :dataset

  def initialize(attributes)
    @dataset = attributes[:dataset]
  end

  def formulate(attributes)
    name = attributes[:name].downcase
    email = attributes[:email]

    return "There is no matching in dataset for #{attributes[:name]} working for #{email}" if @dataset[email].nil?

    dataset[email].map do |rule|
      pattern = Pattern.build(name)
      pattern.predict(rule) + "@#{email}"
    end
  end
end

# Instructions to run:
raw =
{
  "John Ferguson" => "john.ferguson@alphasights.com",
  "Damon Aw" => "damon.aw@alphasights.com",
  "Linda Li" => "linda.li@alphasights.com",
  "Larry Page" => "larry.p@google.com",
  "Sergey Brin" => "s.brin@google.com",
  "Steve Jobs" => "s.j@apple.com"
}
# Create a analyzer object and give it a pattern
analyzer = Analyzer.new
# Analyze the given dataset
analyzer.process(raw)
# Create a predictor object and give it a dataset and a pattern
predictor = Predictor.new(dataset: analyzer.dataset)

# Formulate potential patterns for given name and email
pp predictor.formulate(name: 'Criag Silverstein', email: 'google.com')
pp predictor.formulate(name: 'Peter Wong', email: 'alphasights.com')
pp predictor.formulate(name: 'Steve Wozniak', email: 'apple.com')
pp predictor.formulate(name: 'Barack Obama', email: 'whitehouse.gov')
