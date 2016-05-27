require 'pry'
require 'json'
require "./item"
require "./user"
require "./data_parser"
require "./transaction"
require "./transaction_parser"


p = DataParser.new ("/Users/vega/Desktop/tiyprojects/week2/day_4/shoppe/data/data.json")
p.parse!


t = TransactionParser.new ("/Users/vega/Desktop/tiyprojects/week2/day_4/shoppe/data/transactions.json")
t.parse!

#  First question -----------------------------------------

orders_by_user = {}
orders_by_user.default = 0

t.transaction.each do | t |
  orders_by_user[t["user_id"]] += 1
end

max = orders_by_user.max_by do |user, order|
          order
      end

user_most_orders = ""
p.users.each do |u|
  if u.id == max.first
    user_most_orders = u.name
  end
end

puts "The user that made the most orders was #{user_most_orders}"

binding.pry

#------------------------------------------------------------------




puts "We sold __ Ergonomic Rubber Lamps"
puts "We sold __ items from the Tools category"
puts "Our total revenue was __"
puts "The highest grossing category was __"
