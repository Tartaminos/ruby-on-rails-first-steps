class Tabela < ActiveRecord::Migration
  def up
    create_table :pessoas do |t|
      t.string :nome
      t.string :sobrenome
      t.string :empresa 
      t.timestamps
    end 
  end

  def down
    drop_table :pessoas
  end
end
