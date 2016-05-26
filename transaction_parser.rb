class TransactionParser

attr_reader :transaction

  def initialize path
    @path = path
    @data = JSON.parse(File.read path)
    @transaction = []
  end

  def parse!
    @data.each do |t|
      @transaction.push t
    end

  end





end
