require "rspec"
require "blackjack"

include Blackjack

describe Deck do
  subject(:deck) { Deck.new }

  context "Deck" do
    its("cards.count") { should eq(52) }
#We checked for shuffle with expect { deck.shuffle }.to change {deck.cards) 
#on multiple lines. unsure if it works as a one liner, although it should
    it "should shuffle cards" do
      unshuffled = Deck.new
      deck.shuffle
      deck.cards.should_not eq(unshuffled.cards)
    end

    it "should allow cards to be taken off" do
    #you're checking for two things here: for taking cards off
    #and adding cards to the taken card count
      deck.take(2).count.should eq(2)
      deck.cards.count.should eq(50)
    end

    it "should allow cards to be returned" do
      cards = deck.take(2)
      deck.return(cards)

      deck.cards.count.should eq(52)
    end

    it "should return cards to the bottom" do
      cards = deck.take(2)
      deck.return(cards)
#doesn't really check if they're at the bottom
      deck.take(2).should_not eq(cards)
    end
  end
end
