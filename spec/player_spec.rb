require 'rspec'
require './lib/card'
require './lib/deck'
require './lib/player'

RSpec.describe Player do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new([card])
    player = Player.new('Mary', deck)

    expect(player).to be_an_instance_of(Player)
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)
    deck = Deck.new([card])
    player = Player.new('Mary', deck)

    expect(player.name).to eq('Mary')
    expect(player.has_lost?).to eq(false)
  end
end

