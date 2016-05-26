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
      @users.push(User.new i.values[0], i.values[1], i.values[2])
      binding.pry
    end
    @data["items"].each do |i|
      @items.push(Item.new i.values[0], i.values[1], i.values[2], i.values[3])

    end
  end


end
