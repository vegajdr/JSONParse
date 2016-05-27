class TransactionParser

attr_reader :transaction

  def initialize path
    @path = path
    @data = JSON.parse(File.read path)
    @transaction = []
  end

  def parse!
    @data.each do |i|
      @transaction.push(Transaction.new i["timestamp"], i["user_id"], i["item_id"], i["quantity"])
    end


  end





end
