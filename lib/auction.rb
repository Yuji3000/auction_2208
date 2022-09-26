class Auction
  attr_reader :items
  def initialize
    @items = []
  end

  def add_item(item)
    @items << item
  end

  def item_names
    item_names = []
    @items.each do |item|
      item_names << item.name
    end
    item_names
  end

  def unpopular_items
    unpopular = []
    @items.find_all do |item|
      if (item.bids == {}) == true
        unpopular << item
      end
    end
    return unpopular
  end
  
  def potential_revenue
    bid_array = []
    @items.each do |item|
      if item.current_high_bid != nil
        bid_array << item.current_high_bid
      end
    end
    bid_array.sum
  end

  def bidders
    bid_names = []
    @items.each do |item|
      item.bids.each do |bid|
        bid_names << bid.first.name
      # require 'pry'; binding.pry
      end
    end
    bid_names = bid_names.uniq
    return bid_names
  end
end
