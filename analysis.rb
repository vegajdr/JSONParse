require 'pry'
require 'json'
require "./item"
require "./user"
require "./data_parser"
require "./transaction_parser"


p = DataParser.new ("/Users/vega/Desktop/tiyprojects/week2/day_4/shoppe/data/data.json")
p.parse!
binding.pry
