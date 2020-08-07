class Usuario
  def initialize(nombre, cuentas_bancarias)
    @nombre = nombre
    @cuentas_bancarias = cuentas_bancarias
  end

  def saldo_total
    #total = 0
    #@cuentas_bancarias.each do |cuenta|
    #  total += cuenta.saldo
    #end
    #return total
    return @cuentas_bancarias.inject(0){|sum,cuenta| sum + cuenta.saldo}
  end
end

class CuentaBancaria
  attr_accessor :saldo
  def initialize(banco, numero_de_cuenta, saldo = 0)
    @banco = banco
    @numero_de_cuenta = numero_de_cuenta
    @saldo = saldo
  end

  def transferir(monto, cuenta_destino)
    @saldo -= monto
    cuenta_destino.saldo += monto
  end
end

cuenta = CuentaBancaria.new('Banco de Chile','22334455',5000)
cuenta2 = CuentaBancaria.new('BCI','11223344',5000)

puts cuenta.transferir(5000,cuenta2)

cuenta3 = CuentaBancaria.new('Santander','12345678',5000)
cuenta4 = CuentaBancaria.new('Banco Estado', '8765321',5000)
cuentas = [cuenta, cuenta2, cuenta3, cuenta4]
person = Usuario.new('Pepa',cuentas)

puts person.saldo_total
