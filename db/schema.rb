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

ActiveRecord::Schema.define(:version => 20121024121548) do

  create_table "agendas", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.string   "week"
    t.boolean  "featured"
    t.integer  "instructor_id"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.integer  "week_id"
  end

  create_table "announcements", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "instructor_id"
    t.boolean  "featured"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "doc"
    t.integer  "week_id"
  end

  create_table "instructions", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "instructor_id"
    t.boolean  "featured"
    t.string   "status"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  create_table "instructors", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.text     "description"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "photo"
  end

  add_index "instructors", ["email"], :name => "index_instructors_on_email", :unique => true
  add_index "instructors", ["reset_password_token"], :name => "index_instructors_on_reset_password_token", :unique => true

  create_table "pages", :force => true do |t|
    t.string   "name"
    t.string   "permalink"
    t.text     "content"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "pages", ["permalink"], :name => "index_pages_on_permalink"

  create_table "questions", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "questionable_id"
    t.string   "questionable_type"
    t.boolean  "featured"
    t.string   "status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "resources", :force => true do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "resourceable_id"
    t.string   "resourceable_type"
    t.string   "link"
    t.boolean  "featured"
    t.string   "status"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "doc"
    t.integer  "week_id"
  end

  create_table "users", :force => true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "school"
    t.text     "description"
    t.string   "link"
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "photo"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "weeks", :force => true do |t|
    t.string   "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
