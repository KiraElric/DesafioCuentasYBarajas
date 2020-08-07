require_relative 'carta.rb'

class Baraja
  attr_reader :cartas
  def initialize
    @cartas = []
    ['C','D','E','T'].each do |pinta|
      13.times do |numero|
        num = numero + 1
        @cartas.push(Carta.new(num,pinta))
      end
    end
  end

  def barajar
    return @cartas = @cartas.shuffle
  end

  def sacar
    carta = (@cartas.reverse).pop
    @cartas.delete(carta)
    return carta
  end

  def repartir_mano
    mano = []
    5.times do |i|
      mano.push(sacar)
    end
    return mano
  end
end

deck = Baraja.new

print deck.cartas
puts deck.sacar
puts deck.barajar
print deck.repartir_mano
