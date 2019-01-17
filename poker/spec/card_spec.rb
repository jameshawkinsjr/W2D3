require 'card'

RSpec.describe Card do
    subject(:jack_of_hearts){Card.new(:heart, :jack)}

    describe "#initialize" do
        it "creates a new instance of a card" do
            expect(jack_of_hearts).to be_an_instance_of(Card)
        end
        it "does not initialize card with invalid suit" do 
            expect{Card.new(:circle, :ten)}.to raise_error(ArgumentError)
        end
        it "does not initialize card with invalid name" do
            expect{Card.new(:diamond, :twelve)}.to raise_error(ArgumentError)
        end
    end

    describe "#name" do
        it "returns the card name" do
            expect(jack_of_hearts.name).to eq(:jack)
        end
        it "does not allow changing card name" do 
            expect{jack_of_hearts.name = :queen}.to raise_error
        end
    end

    describe "#suit" do
        it "returns the card suit" do
            expect(jack_of_hearts.suit).to eq(:heart)
        end
        it "does not allow changing card suit" do 
            expect{jack_of_hearts.suit = :spade}.to raise_error
        end
    end
   
    
end