class CreateCebolinhas < ActiveRecord::Migration
  def change
    create_table :cebolinhas do |t|
      t.string :cabelo
      t.string :olhos
      t.string :orelhas
      t.integer :idade
      t.float :altura
      t.boolean :vivo

      t.timestamps
    end
  end
end
