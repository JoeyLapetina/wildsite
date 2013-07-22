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

ActiveRecord::Schema.define(:version => 20130722004108) do

  create_table "favorites", :force => true do |t|
    t.integer  "stream_id"
    t.integer  "user_id"
    t.boolean  "owner",      :default => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  create_table "impressions", :force => true do |t|
    t.string   "impressionable_type"
    t.integer  "impressionable_id"
    t.integer  "user_id"
    t.string   "controller_name"
    t.string   "action_name"
    t.string   "view_name"
    t.string   "request_hash"
    t.string   "ip_address"
    t.string   "session_hash"
    t.text     "message"
    t.text     "referrer"
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "impressions", ["controller_name", "action_name", "ip_address"], :name => "controlleraction_ip_index"
  add_index "impressions", ["controller_name", "action_name", "request_hash"], :name => "controlleraction_request_index"
  add_index "impressions", ["controller_name", "action_name", "session_hash"], :name => "controlleraction_session_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "ip_address"], :name => "poly_ip_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "request_hash"], :name => "poly_request_index"
  add_index "impressions", ["impressionable_type", "impressionable_id", "session_hash"], :name => "poly_session_index"
  add_index "impressions", ["impressionable_type", "message", "impressionable_id"], :name => "impressionable_type_message_index"
  add_index "impressions", ["user_id"], :name => "index_impressions_on_user_id"

  create_table "scrapebots", :force => true do |t|
    t.string   "name"
    t.text     "bio"
    t.string   "game"
    t.integer  "stream_count"
    t.integer  "stream_item_count"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "stream_items", :force => true do |t|
    t.string   "by_line"
    t.string   "item_link"
    t.string   "picture"
    t.string   "replies"
    t.string   "stream_id"
    t.string   "title"
    t.string   "views"
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
    t.string   "string_id"
    t.text     "body"
    t.boolean  "hide_stream_item", :default => false
  end

  create_table "streams", :force => true do |t|
    t.string   "stream_url"
    t.string   "item"
    t.string   "title"
    t.string   "item_link"
    t.string   "body"
    t.string   "picture"
    t.string   "video"
    t.datetime "created_at",                            :null => false
    t.datetime "updated_at",                            :null => false
    t.string   "name"
    t.string   "by_line"
    t.string   "site_root"
    t.string   "span"
    t.boolean  "picture_root"
    t.boolean  "link_root"
    t.integer  "limit"
    t.string   "stream_type",     :default => "stream"
    t.string   "replies"
    t.string   "views"
    t.boolean  "active"
    t.integer  "rank",            :default => 0
    t.string   "game"
    t.boolean  "use_more",        :default => true
    t.string   "stream_home_url"
    t.string   "category"
    t.boolean  "reverse_stream",  :default => false
    t.boolean  "track",           :default => false
    t.boolean  "is_ready",        :default => false
  end

  create_table "submissions", :force => true do |t|
    t.string   "submission_type"
    t.string   "submission_url"
    t.text     "submission_description"
    t.string   "submitter_name"
    t.string   "submitter_email"
    t.datetime "created_at",             :null => false
    t.datetime "updated_at",             :null => false
  end

  create_table "users", :force => true do |t|
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
    t.boolean  "admin"
    t.string   "level"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "words", :force => true do |t|
    t.string   "word"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

end
