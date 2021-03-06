# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20191003164909) do

  create_table "bem_vindo", :force => true do |t|
    t.string   "caixa"
    t.string   "usuario"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "caixas_eletronicos", :force => true do |t|
    t.string   "nome"
    t.string   "local"
    t.integer  "nota2"
    t.integer  "nota5"
    t.integer  "nota10"
    t.integer  "nota20"
    t.integer  "nota50"
    t.integer  "nota100"
    t.boolean  "funcionando"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "usuarios", :force => true do |t|
    t.string   "nome"
    t.string   "email"
    t.string   "senha"
    t.string   "codigo"
    t.boolean  "gerente"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
