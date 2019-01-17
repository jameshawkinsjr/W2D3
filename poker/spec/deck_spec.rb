require 'deck'

RSpec.describe Deck do
    subject(:deck){Deck.new}

    describe "#initialize" do
        it "creates a new instance of a deck" do
            expect(deck).to be_an_instance_of(Deck)
        end
        it "creates a deck of 52 cards" do 
            expect(deck.pile.length).to eq(52)
            expect(deck.pile.first).to be_an_instance_of(Card)
        end
        it "does not include duplicate cards" do
            expect(deck.pile).to eq(deck.pile.uniq)       
        end
    end

    describe "#deal_card" do
        it "removes the first card from the deck" do
            first_card = deck.pile.first
            expect(deck.deal_card).to eq(first_card)
            expect(deck.pile.length).to eq(51)
        end
    end

    describe "#shuffle!" do
        it "changes the order of cards in the deck" do
            unshuffled_deck = deck.dup 
            deck.shuffle!
            expect(deck).to_not eq(unshuffled_deck)
        end
    end

    describe "#inspect" do 
        it "does not show card values" do 
            expect(deck.inspect).to eq(deck.object_id)
        end
    end
   
    
end