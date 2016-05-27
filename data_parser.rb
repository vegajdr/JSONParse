class DataParser
  attr_reader :path, :users, :items

  def initialize path
    @path = path
    @data = JSON.parse(File.read path)


    @users = []
    @items = []

  end

  def parse!
    @data["users"].each do |i|
      @users.push(User.new i["id"], i["name"], i["address"])
      #binding.pry
    end
    @data["items"].each do |i|
      @items.push(Item.new i["id"], i["name"], i["category"], i["price"])
    end
  end


end
