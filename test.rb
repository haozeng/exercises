require 'pry'



def some_method
 File.open('')
rescue Exception => e
  binding.pry
  p 'Rescuing exceptions'
end

some_method
