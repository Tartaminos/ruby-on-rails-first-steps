class Pessoa < ActiveRecord::Base
    attr_accessible :nome, :sobrenome, :empresa

end