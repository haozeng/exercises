require 'rspec'
require 'pry'

class Policy
  attr_reader :start, :end

  def initialize(attributes)
    @start = attributes[:start]
    @end = attributes[:end]
  end

  def overlapping?(options={})
    window_start = options[:policy_start]
    window_end = options[:policy_end]
    raise 'There has to be start and end date' unless window_start && window_end

    return true if @start.between?(window_start, window_end)
    return true if @start < window_start && @end > window_start

    false
  end
end

describe 'Policy' do

  let(:policy_start) { Date.new(2013,03,01) }
  let(:policy_end) { Date.new(2013,04,01) }

  # Start/End dates which are before/between/after the policy dates
  let(:start_before) { Date.new(2013,02,15) }
  let(:end_before) { Date.new(2013,02,28) }
  let(:start_between) { Date.new(2013,03,05) }
  let(:end_between) { Date.new(2013,03,20) }
  let(:start_after) { Date.new(2013,04,05) }
  let(:end_after) { Date.new(2013,04,20) }

  describe '#overlapping?' do
    it 'should return ture if policy starts and ends between the window_start and window_end date' do
      policy = Policy.new({:start => start_between, :end => end_between})
      policy.overlapping?({:policy_start => policy_start, :policy_end => policy_end}).should be_true
    end

    it 'should return true if policy starts before the window_start and ends after window_start date' do
      policy = Policy.new({:start => start_before, :end => end_between})
      policy.overlapping?({:policy_start => policy_start, :policy_end => policy_end}).should be_true
    end

    it 'should return true if policy starts before the window_start and ends after window_end date' do
      policy = Policy.new({:start => start_before, :end => end_after})
      policy.overlapping?({:policy_start => policy_start, :policy_end => policy_end}).should be_true
    end

    it 'should return false if policy starts and ends after the window_start and window_end date' do
      policy = Policy.new({:start => start_after, :end => end_after})
      policy.overlapping?({:policy_start => policy_start, :policy_end => policy_end}).should be_false
    end

    it 'should return false if policy starts and ends before the window_start and window_end date' do
      policy = Policy.new({:start => start_before, :end => start_before})
      policy.overlapping?({:policy_start => policy_start, :policy_end => policy_end}).should be_false
    end
  end
end
