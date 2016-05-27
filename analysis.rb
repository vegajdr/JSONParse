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
  orders_by_user[t.user_id] += 1
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

#binding.pry

#------------------------------------------------------------------

number_of_lamps = 0
item_id = 8

t.transaction.each do | t |
  if t.item_id == item_id
    number_of_lamps += t.quantity
  end

end

puts "We sold #{number_of_lamps} Ergonomic Rubber Lamps"

#--Second question -----------------
tool_ids = []
items_by_category = 0

p.items.each do |i|
  if i.category.include?("Tools")
    tool_ids.push i.id
  end
end

t.transaction.each do |t|
  if tool_ids.include?(t.item_id)
    items_by_category += t.quantity
  end
end

puts "We sold #{items_by_category} items from the Tools category"

#--Third question -----------

item_prices = {}

p.items.each do | i |
  item_prices[i.id] = i.price
end

binding.pry

puts "Our total revenue was __"
puts "The highest grossing category was __"
