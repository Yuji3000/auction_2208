require 'rspec'
require './lib/item'
require './lib/attendee'
require './lib/auction'

describe 'initialize' do
  it 'exists ' do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1).to be_an_instance_of(Item)
    item2 = Item.new('Bamboo Picture Frame')
    expect(item2).to be_an_instance_of(Item)
  end

  it 'has attributes' do
    item1 = Item.new('Chalkware Piggy Bank')
    expect(item1.name).to eq("Chalkware Piggy Bank")
    item2 = Item.new('Bamboo Picture Frame')
    expect(item2.name).to eq('Bamboo Picture Frame')
  end
  it 'can add bids and check them' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')

    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    expect(item1.bids).to eq({})

    item1.add_bid(attendee2, 20)
    item1.add_bid(attendee1, 22)
    expect(item1.bids).to eq({
      attendee2 => 20,
      attendee1 => 22
    })
    expect(item1.current_high_bid).to eq(22)
  
    
  end

  xit 'can close bids' do
    item1 = Item.new('Chalkware Piggy Bank')
    item2 = Item.new('Bamboo Picture Frame')
    item3 = Item.new('Homemade Chocolate Chip Cookies')
    item4 = Item.new('2 Days Dogsitting')
    item5 = Item.new('Forever Stamps')
    attendee1 = Attendee.new({name: 'Megan', budget: '$50'})
    attendee2 = Attendee.new({name: 'Bob', budget: '$75'})
    attendee3 = Attendee.new({name: 'Mike', budget: '$100'})
    auction = Auction.new
    auction.add_item(item1)
    auction.add_item(item2)
    auction.add_item(item3)
    auction.add_item(item4)
    auction.add_item(item5)
    item1.add_bid(attendee1, 22) 
    item1.add_bid(attendee2, 20)
    item4.add_bid(attendee3, 50)
    item3.add_bid(attendee2, 15)
    expect(item1.bids).to eq({
      attendee1 => 22,
      attendee2 => 20
      })
      item1.close_bidding
      item1.add_bid(attendee3, 70)
      expect(item1.bids).to eq({
        attendee1 => 22,
        attendee2 => 20
        })
  end

end