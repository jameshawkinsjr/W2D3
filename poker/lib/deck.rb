require_relative 'card'
require_relative 'sharedvariables'

class Deck
    include SharedVariables
    attr_accessor :pile

    def initialize
        @pile = create_deck
    end    

    def inspect
        self.object_id
    end

    def deal_card
        first_card = pile.first
        pile.shift
        first_card
    end

    def shuffle!
        pile.shuffle!
    end

    private
    def create_deck
        new_deck = []
        SharedVariables.suits.each do |suit|
            SharedVariables.names.each do |name|
                new_deck << Card.new(suit,name)
            end
        end
        new_deck
    end

end