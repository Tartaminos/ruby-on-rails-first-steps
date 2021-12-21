class CaixaEletronico < ActiveRecord::Base
    attr_accessible :nome, :local, :nota2, :nota5, :nota10, :nota20, :nota50, :nota100, :funcionando, :sacar, :valor_saque
   
    validate :validar

    
    
      
    def abastecer
        
        self.nota2 = 0
        self.nota5 = 0
        self.nota10 = 0
        self.nota50 = 0
        self.nota100 = 0

        
    end
    
   
    def valor_caixa
        @valor_caixa = self.nota2 * 2 + self.nota5 * 5 + self.nota10 * 10 + self.nota20 * 20 + self.nota50 * 50 + self.nota100 * 100
    end

    def validar
        @dez = 10000
        @valor_caixa = valor_caixa
        if @valor_caixa > @dez
            errors.add(:base, 'O valor total abastecido deve ser menor que 10,000')
        end
        
    end

    def sacar(valor_saque)
        @valor_saque = valor_saque
        @valor_caixa = valor_caixa
        @nota2_cont = 0
        @nota5_cont = 0
        @nota10_cont = 0
        @nota20_cont = 0
        @nota50_cont = 0
        @nota100_cont = 0
        @contador_teste = @valor_saque

        if valor_caixa > 0 && self.funcionando == true && @valor_saque != 3 && @valor_saque != 1
            if valor_caixa >= @valor_saque
                while @valor_saque % 5 != 0 && self.nota2 > 0 do
                    valor_impar
                end

                @controle_nota2 = @nota2_cont
                @controle_nota5 = @nota5_cont
                @controle_saque = @valor_saque

                if @valor_saque / 100 && self.nota100 > 0
                    saca_100
                end
                if @valor_saque /  50 && self.nota50 > 0
                    saca_50
                end
                if @valor_saque / 20 && self.nota20 > 0
                    saca_20
                end
                if @valor_saque / 10 && self.nota10 > 0
                    saca_10
                end
                                
                if @valor_saque / 5 && self.nota5 > 0
                    saca_5
                end
                if @valor_saque / 2 && self.nota2 > 0
                    saca_2
                end 

                if @valor_saque > 0
                    @valor_saque = @valor_saque + ((@nota2_cont - @controle_nota2) * 2) + ((@nota5_cont - @controle_nota5) * 5)
                    self.nota2 = self.nota2 + (@nota2_cont - @controle_nota2)
                    @nota2_cont  = @controle_nota2
                    self.nota5 = self.nota5 + @nota5_cont
                    @nota5_cont = 0
                    if @valor_saque / 2 && self.nota2 > 0
                        saca_2
                    end

                    if @valor_saque / 5 && self.nota5 > 0
                        saca_5
                    end
                end
                
                if @valor_saque > 0
                    return "Valor indisponível devida combinação de notas"
                end
                self.save
            
            end
        else
            return "Caixa Indisponível ou Com falta de Cédulas "

        end
        natela


    end


    def natela
        
        if valor_caixa < @valor_saque
            
            @valor_saque = 0
            self.save
       else
            return "Quantidade de notas de 100: #{@nota100_cont} <br> 
            Quantidade de notas de 50: #{@nota50_cont} <br>
            Quantidade de notas de 20: #{@nota20_cont} <br>
            Quantidade de notas de 10: #{@nota10_cont} <br>
            Quantidade de notas de 5: #{@nota5_cont} <br>
            Quantidade de notas de 2: #{@nota2_cont} <br>
            valor do caixa #{valor_caixa}"
             
       end
    
    end



    def valor_impar
                @valor_caixa = @valor_caixa - 2
                self.nota2 = nota2 - 1
                @valor_saque = @valor_saque - 2 
                @nota2_cont = @nota2_cont + 1
    end

    def saca_100
        if @valor_saque / 100 <= self.nota100
            nota100 = @valor_saque / 100
            self.nota100 = self.nota100 - nota100 
            @nota100_cont = @nota100_cont + nota100
            @valor_caixa = @valor_caixa - (@valor_saque / 100)*100
            @valor_saque = @valor_saque - (@valor_saque / 100)*100
        else
            nota100 = @valor_saque / 100
            @valor_saque = @valor_saque - self.nota100 * 100
            @valor_caixa = @valor_caixa - nota100 * 100
            @nota100_cont = self.nota100
            self.nota100 = 0
            
        end 
            
    end

    def saca_50
        if @valor_saque / 50 <= self.nota50    
            nota50 = @valor_saque / 50
            self.nota50 = self.nota50 - nota50 
            @nota50_cont = @nota50_cont + nota50
            @valor_caixa = @valor_caixa - (@valor_saque / 50)*50
            @valor_saque = @valor_saque - (@valor_saque / 50)*50
        else
            nota50 = @valor_saque / 50
            @valor_saque = @valor_saque - self.nota50 * 50
            @valor_caixa = @valor_caixa - nota50 * 50
            @nota50_cont = self.nota50
            self.nota50 = 0        
        end     
    end

    def saca_20
        if @valor_saque / 20  <= self.nota20
            nota20 = @valor_saque / 20
            self.nota20 = self.nota20 - nota20 
            @nota20_cont = @nota20_cont + nota20
            @valor_caixa = @valor_caixa - (@valor_saque / 20)*20
            @valor_saque = @valor_saque - (@valor_saque / 20)*20
        else
            nota20 = @valor_saque / 20
            @valor_saque = @valor_saque - self.nota20 * 20
            @valor_caixa = @valor_caixa - nota20 * 20
            @nota20_cont = self.nota20
            self.nota20 = 0
        end 
    end
    
    def saca_10
        if @valor_saque / 10 <= self.nota10
            nota10 = @valor_saque / 10
            self.nota10 = self.nota10 - nota10
            @nota10_cont = @nota10_cont + nota10
            @valor_caixa = @valor_caixa - (@valor_saque / 10)*10
            @valor_saque = @valor_saque - (@valor_saque / 10)*10
        else
            nota10 = @valor_saque / 10
            @valor_saque = @valor_saque - self.nota10 * 10
            @valor_caixa = @valor_caixa - nota10 * 10
            @nota10_cont = self.nota10
            self.nota10 = 0
        end     
    end

    def saca_5
        if @valor_saque / 5 <= self.nota5
            nota5 = @valor_saque / 5
            self.nota5 = self.nota5 - nota5 
            @nota5_cont = @nota5_cont + nota5
            @valor_caixa = @valor_caixa - (@valor_saque / 5)*5
            @valor_saque = @valor_saque - (@valor_saque / 5)*5
        else
            nota5 = @valor_saque / 5
            @valor_saque = @valor_saque - self.nota5 * 5
            @valor_caixa = @valor_caixa - nota5 * 5
            @nota5_cont = self.nota5
            self.nota5 = 0

            
        end         
        
    end

    def saca_2
        if @valor_saque / 2 <= self.nota2
            nota2 = @valor_saque / 2
            self.nota2 = self.nota2 - nota2 
            @nota2_cont = @nota2_cont + nota2
            @valor_caixa = @valor_caixa - (@valor_saque / 2)*2
            @valor_saque = @valor_saque - (@valor_saque / 2)*2
        else
            nota2 = @valor_saque / 2
            @valor_saque = @valor_saque - self.nota2 * 2
            @valor_caixa = @valor_caixa - nota2 * 2
            @nota2_cont = self.nota2
            self.nota2 = 0
            
        end 
    end
     

end