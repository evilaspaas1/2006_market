class Market
  attr_reader :name,
              :vendors

  def initialize(name)
    @name = name
    @vendors = []
  end

  def add_vendor(vendor)
    @vendors << vendor
  end

  def vendor_names
    @vendors.map do |vendor|
      vendor.name
    end
  end

  def vendors_that_sell(item)
    vendors_that_sell_item = []
    @vendors.each do |vendor|
      if vendor.inventory[item] != 0
        vendors_that_sell_item << vendor
      end
    end
    vendors_that_sell_item
  end

  def total_inventory
    market_inventory = Hash.new do |market_inventory, item|
      market_inventory[item] = {quantity: 0, vendors: []}
    end
    @vendors.each do |vendor|
      vendor.inventory.each do |vendor_item, quantity|
        market_inventory[vendor_item][:quantity] += quantity
        market_inventory[vendor_item][:vendors] << vendor
      end
    end
    market_inventory
  end
end
