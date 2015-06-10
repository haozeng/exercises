require 'pry'

# Trade FTSE50
initial_unit_price = 13300
unit = 1
margin = 0.167

initial_contract_number = 14
initial_contract_value = 186200 # 28 * 13440
start_balance = 31095 # 30105

# Senario, consider sugar rallies to .18 dollar/pound, and avergly increase 2% per day until .18
# Each time, I want to invest all profits
rate = 0.03
current_unit_price = initial_unit_price
current_contract_value = initial_contract_value
current_contract_number = initial_contract_number
current_contract_unit_price = current_unit_price * unit * margin

remaining_profit = 0
count = 0

while current_unit_price < 25000
  # calculating profit
  profit = rate * current_contract_value + remaining_profit

  # calculating current contract unit price (initial margin)
  current_unit_price = current_unit_price * (1 + rate)
  current_contract_unit_price = current_unit_price * unit * margin

  # calculating additional contracts that can be bought
  additional_contract_allowed = (profit / current_contract_unit_price).to_i
  remaining_profit = profit % current_contract_unit_price

  # add the addtional contract to the current contract
  current_contract_number += additional_contract_allowed
  current_contract_value = current_contract_number * current_unit_price * unit
  count += 1
end

puts "total number of sessions"
puts count

puts "total number of contracts"
puts current_contract_number

puts "total account value"
puts current_contract_value * margin