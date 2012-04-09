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

ActiveRecord::Schema.define(:version => 20120407183336) do

  create_table "groups", :force => true do |t|
    t.string    "name"
    t.string    "description"
    t.timestamp "lottery_date"
    t.integer   "owner_id"
    t.integer   "dollar_amount"
    t.timestamp "created_at",    :null => false
    t.timestamp "updated_at",    :null => false
  end

  create_table "groups_users", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "group_id"
  end

  create_table "lotterytickets", :force => true do |t|
    t.integer   "group_id"
    t.integer   "num1"
    t.integer   "num2"
    t.integer   "num3"
    t.integer   "num4"
    t.integer   "num5"
    t.integer   "megaplier"
    t.timestamp "created_at", :null => false
    t.timestamp "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string    "first_name"
    t.string    "last_name"
    t.string    "email"
    t.string    "photo_url"
    t.timestamp "created_at",        :null => false
    t.timestamp "updated_at",        :null => false
    t.string    "username"
    t.string    "crypted_password"
    t.string    "password_salt"
    t.string    "persistence_token"
  end

end
