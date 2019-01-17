require_relative 'sharedvariables'

class Card
    include SharedVariables
    attr_reader :suit, :name



    def initialize(suit, name)
        raise ArgumentError unless SharedVariables.suits.include?(suit)
        raise ArgumentError unless SharedVariables.names.include?(name)
        @suit = suit
        @name = name
    end

end