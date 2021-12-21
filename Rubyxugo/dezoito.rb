class Calculadora
    attr_accessor :saldo

    def initialize
        super
        @saldo = 0



    end
    
    def soma(valor)
        @saldo += valor

    end

    def subtrai(valor)
        @saldo -= valor
    end

    def dividir(valor)
        @saldo = @saldo / valor

    end

    def multiplica(valor)
        @saldo = @saldo * valor
    end



end 
