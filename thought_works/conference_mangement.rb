require 'pry'
require 'active_support/time'

def generate_schedule(talks, tracks=2)

  # Save all talks in hash data structures, key is time
  hash = {}
  talks.map do |talk|
    time = talk.split(' ').last.to_i
    hash[time] ||= []
    hash[time] << talk
  end

  # Since morning session is 3 hours (180mins), we have to
  # make sure sum of a sepcific range of talks is divisible by
  # either 120mins or 180mins

  # Store generated tracks in a conference hash
  conference = {}

  # Generate morning and afternoon sessions for tracks
  tracks.times do |i|
    conference[i+1] ||= {}
    conference[i+1][:morning], revised_hash = select_morning_talks(hash)
    conference[i+1][:afternoon] = select_afternoon_talks(revised_hash)
    hash = revised_hash
  end

  # format the schdule and print it out
  format_schedule(conference)
end

# We generated tasks using the concept of backtracking
def select_morning_talks(talk_hash)
  keys = talk_hash.keys
  original = Marshal.load(Marshal.dump(talk_hash))
  sum = 0
  until sum == 180
    talk_hash = Marshal.load(Marshal.dump(original))
    sum = 0
    session = []
    keys.each do |key|
      size = talk_hash[key].size
      number = rand(size+1)
      chosen = talk_hash[key].sample(number)
      session << chosen
      talk_hash[key] = talk_hash[key] - chosen
      sum += number * key
      break if sum >= 180
    end
  end
  return [session.flatten, talk_hash]
end

def select_afternoon_talks(talk_hash)
  keys = talk_hash.keys
  original = Marshal.load(Marshal.dump(talk_hash))
  sum = 0
  until sum > 180 && sum < 240
    talk_hash = Marshal.load(Marshal.dump(original))
    session = []
    sum = 0
    keys.each do |key|
      size = talk_hash[key].size
      number = rand(size+1)
      chosen = talk_hash[key].sample(number)
      session << chosen
      talk_hash[key] = talk_hash[key] - chosen
      sum += number * key
    end
  end
  session.flatten
end

def format_schedule(conference)
  conference.each do |number, track|
    puts "Track #{number}"
    time = Time.new(2014,01,01,"09:00")
    track.each do |session, talks|
      talks.each do |talk|
        puts [time.strftime("%H:%M%p").to_s, talk].join(' ')
        time += talk.split(' ').last.to_i.minutes
      end
      case session
      when :afternoon
        puts [time.strftime("%H:%M%p").to_s, 'Networking Event'].join(' ')
      when :morning
        puts '12:00PM Lunch'
        time += 1.hours
      end
    end
    puts "\n"
  end
end

def start
  generate_schedule(File.open('./input.txt').map(&:chop))
end

# Start the program
start()
