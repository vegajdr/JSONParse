require "httparty"
require "pry"
require "./item"
require "./user"
require "./data_parser"
require "./transaction"
require "./transaction_parser"
require "./password"


db = HTTParty.get( "https://shopnatra.herokuapp.com/data",
  query: Password

)

transactions = HTTParty.get( "https://shopnatra.herokuapp.com/transactions/2001-01-01",
  query: Password

)

p = DataParser.new db
t = TransactionParser.new transactions

p.parse!
t.parse!
#  First question -----------------------------------------


orders_by_user = {}
orders_by_user.default = 0


t.transaction.each do | t |
  orders_by_user[t.user_id] += 1
end
#binding.pry

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


#  Second question ------------------------------------------------------------------


selected_item = p.items.find do |i|
  i.name == "Ergonomic Rubber Lamps"
end
total = 0
t.transaction.each do |t|
  if t.item_id == selected_item.id
    total += t.quantity
  end
end

total2 = t.transaction.
  select { |t| t.item_id == selected_item.id }.
  map { |t| t.quantity }.
  reduce :+

puts "We sold #{total2} Ergonomic Rubber Lamps"

#--Third question -----------------
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

#  Fourth question ---------------------------------

item_prices = {}
revenue = 0
totals_list = []

p.items.each do | i |
  item_prices[i.id] = i.price
end

t.transaction.each do |t|
  totals_list.push((t.quantity) * (item_prices[t.item_id]))
end

total = totals_list.reduce(:+).round(2)

puts "Our total revenue was #{total}"
#  Fifth question ----------------------------------

categorydb = []
category_ids = {}
category_totals = {}

p.items.each do |t|
  categorydb.push(t.category.split(" & "))
end

categories = categorydb.flatten.uniq


categories.each do |c|
  category_ids[c] = []
  category_totals[c] = 0
end


p.items.each do |i|
  category_ids.each do | category, ids|
    if i.category.include?(category)
      category_ids[category].push(i.id)
    end
  end
end

#
category_ids.each do | category, array |
  t.transaction.each do | transaction |
    if category_ids[category].include? transaction.item_id
      category_totals[category] += item_prices[transaction.item_id] * transaction.quantity
    end
  end

end

category_max = (category_totals.max_by { |category, totals| totals }).first

binding.pry

puts "The highest grossing category was #{category_max}"

#binding.pry
#puts db
