quarter = 25
dime = 10
nickel = 5
penny = 1

cash = 1234.23 * 100

number_of_quarters = (cash / quarter).floor
cash = cash - number_of_quarters * 25.0

number_of_dimes = (cash / 10).floor
cash = cash - number_of_dimes * 10.0

number_of_nickels = (cash / 5).floor
cash = cash - number_of_nickels * 5.0

number_of_pennies = cash.floor

puts "#{number_of_quarters} quarters"
puts  "#{number_of_dimes} dimes"
puts  "#{number_of_nickels} nickels"
puts  "#{number_of_pennies} pennies"
