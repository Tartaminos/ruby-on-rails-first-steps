class CreateTableVeiculos < ActiveRecord::Migration
  def up #fazer a coisa (criar a tabela) oposto ao down
    create_table :veiculos do |t|
      t.string :nome
      t.integer :velocidade_maxima
      t.integer :velocidade_atual
      t.integer :quantidade_marchas
      t.integer :marcha_atual
      t.boolean :ligado
      t.timestamps
    end


  end

  def down #desfazer a coisa (deletar a tabela) oposto ao up
    drop_table :veiculos

  end
end
