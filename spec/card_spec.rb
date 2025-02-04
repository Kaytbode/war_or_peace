require 'rspec'
require './lib/card'
require './lib/deck'

RSpec.describe Card do
  it "exists" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card).to be_an_instance_of(Card)
  end

  it "has readable attributes" do
    card = Card.new(:diamond, 'Queen', 12)

    expect(card.suit).to eq(:diamond)
    expect(card.value).to eq('Queen')
    expect(card.rank).to eq(12)
  end
end

RSpec.describe Deck do
  it "exists" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14) 

    cards = [ card1, card2, card3 ]

    deck = Deck.new(cards)

    expect(deck).to be_an_instance_of(Deck)
  end

  it "returns the correct values" do
    card1 = Card.new(:diamond, 'Queen', 12)
    card2 = Card.new(:spade, '3', 3)
    card3 = Card.new(:heart, 'Ace', 14) 

    cards = [ card1, card2, card3 ]

    deck = Deck.new(cards)

    expect(deck.rank_of_card_at(0)).to eq(12)
    expect(deck.high_ranking_cards()).to eq([card1, card3])
    expect(deck.percent_high_ranking()).to eq(66.67)
    expect(deck.remove_card()).to eq(card1)
    
    card4 = Card.new(:club, '5', 5)

    deck.add_card(card4)

    expect(deck.cards).to eq([card2, card3, card4])
  end
end