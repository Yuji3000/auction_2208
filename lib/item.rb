class Item
  attr_reader :name,
              :bids
  def initialize(name)
    @name = name
    @bids = Hash.new(0)
  end

  def add_bid(attendee, bid)
    @bids[attendee] += bid
  end

  def current_high_bid
    @bids.values.max
  end

  def close_bidding
   
  end
end