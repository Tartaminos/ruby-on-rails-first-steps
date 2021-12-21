class CreateTableBemVindos < ActiveRecord::Migration
  def up
    create_table :bem_vindo do |t|
      t.string :caixa
      t.string :usuario
      t.timestamps
    end
  end

  def down
    drop_table :bem_vindo
  end
end
