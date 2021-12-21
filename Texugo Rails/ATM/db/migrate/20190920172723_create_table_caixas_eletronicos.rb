class CreateTableCaixasEletronicos < ActiveRecord::Migration
  def up
    create_table :caixas_eletronicos do |t|
      t.string :nome
      t.string :local
      t.integer :nota2
      t.integer :nota5
      t.integer :nota10
      t.integer :nota20
      t.integer :nota50
      t.integer :nota100
      t.boolean :funcionando
      t.timestamps
    end
  end

  def down
    drop_table :caixas_eletronicos
  end
end
