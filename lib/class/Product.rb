class Product
  attr_accessor :name, :price
  attr_reader :uuid

  def initialize(uuid, name, price)
    @uuid = uuid
    @name = name
    @price = price
  end

  def update_name(new_name)
    @name = new_name
  end

  def update_price(new_price)
    @price = new_price
  end
end
