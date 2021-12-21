class Veiculo < ActiveRecord::Base
    attr_accessible :nome, :velocidade_maxima, :velocidade_atual, :quantidade_marchas, :marcha_atual, :ligado

    def acelerar
        if pode_acelerar?
            self.velocidade_atual = self.velocidade_atual + 10
            self.marcha_atual = self.velocidade_atual / 20 + 1
            self.save    
        end
    end    

    def frear
        if self.ligado == true
            if self.velocidade_atual > 0
                self.velocidade_atual = self.velocidade_atual - 10
                self.marcha_atual = self.velocidade_atual / 20 + 1
                self.save
            elsif
                self.velocidade_atual == 0 && self.marcha_atual == 1
                self.marcha_atual = 0
                self.save
            end
        end
    end

    def ligar
        if self.velocidade_atual == 0
            self.ligado = true
            self.save
        end
    end

    def desligar
        if self.velocidade_atual == 0
            self.ligado = false
            self.save
        end
    end

    def pode_acelerar?
        self.ligado == true && self.velocidade_atual <= self.velocidade_maxima && self.marcha_atual < self.quantidade_marchas
    end



end