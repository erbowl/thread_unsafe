class Basket
  @@total = 0
  
  def self.init
    @@total = 0
  end

  def self.add(name, count)
    @@total += Item.find_by(name: name).price * count
  end

  def self.result
    @@total
  end
end
