class Usuario < ActiveRecord::Base
    attr_accessible :nome, :email, :senha, :codigo, :gerente, :senha_confirmation
    attr_accessor :senha_confirmation
    validates :nome, :email, :senha, presence: true
    validates :email, uniqueness: true
    validates :senha, length: { minimum: 6 }
    validates :email, format: {with: /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
    validates :senha_confirmation, presence: true
    validates :senha, :confirmation => true
    
    
    def validou?(senha)
        if self.senha == senha
            return true
        end
        
    end
end