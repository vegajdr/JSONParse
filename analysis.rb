require 'pry'
require 'json'
require "./item"
require "./user"
require "./data_parser"
require "./transaction_parser"


p = DataParser.new ("/Users/vega/Desktop/tiyprojects/week2/day_4/shoppe/data/data.json")
p.parse!


t = TransactionParser.new ("/Users/vega/Desktop/tiyprojects/week2/day_4/shoppe/data/transactions.json")
t.parse!


orders_by_user = {}
orders_by_user.default = 0

t.transaction.each do | i |
  orders_by_user[i["user_id"]] = orders_by_user[i["user_id"]] + 1
end

max = orders_by_user.max_by {|k,v| v}


binding.pry




puts "The user that made the most orders was __"
puts "We sold __ Ergonomic Rubber Lamps"
puts "We sold __ items from the Tools category"
puts "Our total revenue was __"
puts "The highest grossing category was __"
