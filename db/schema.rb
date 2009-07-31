# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20090730193945) do

  create_table "assets", :force => true do |t|
    t.string   "title"
    t.string   "caption"
    t.integer  "attatchment_id"
    t.string   "attatchment_type"
    t.string   "asset_file_name"
    t.string   "asset_content_type"
    t.integer  "asset_file_size"
    t.datetime "asset_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "attatchments", :force => true do |t|
    t.integer  "asset_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "enquiries", :force => true do |t|
    t.datetime "created_at"
    t.boolean  "newsletter",                 :default => false
    t.string   "source"
    t.string   "name"
    t.string   "role"
    t.string   "company"
    t.string   "email"
    t.string   "telephone"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "county"
    t.string   "postcode"
    t.string   "prefered_method_of_contact"
    t.text     "message"
    t.string   "gender"
    t.integer  "age"
    t.string   "referal"
  end

  create_table "events", :force => true do |t|
    t.string   "title"
    t.datetime "start"
    t.datetime "finish"
    t.string   "intro"
    t.string   "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "location"
    t.string   "lng"
    t.string   "lat"
  end

  create_table "file_uploads", :force => true do |t|
    t.string   "file_file_name"
    t.string   "file_content_type"
    t.string   "title"
    t.datetime "created_at"
  end

  create_table "images", :force => true do |t|
    t.datetime "created_at"
    t.string   "alt"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.float    "resize",             :default => 1.0
    t.integer  "crop_w"
    t.integer  "crop_h"
    t.integer  "crop_x"
    t.integer  "crop_y"
    t.integer  "page_id"
  end

  create_table "pages", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "type"
    t.string   "title"
    t.string   "meta_title"
    t.string   "meta_description"
    t.string   "meta_keywords"
    t.string   "nav_title"
    t.string   "slug"
    t.string   "slug_path"
    t.string   "title_path"
    t.boolean  "locked",             :default => false, :null => false
    t.boolean  "published",          :default => false, :null => false
    t.datetime "publish_date"
    t.string   "url"
    t.text     "intro"
    t.text     "body"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.string   "subtitle"
  end

  create_table "promos", :force => true do |t|
    t.integer  "page_id"
    t.string   "title"
    t.string   "override_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "intro"
    t.integer  "position"
    t.string   "location"
    t.string   "subtitle"
  end

  create_table "users", :force => true do |t|
    t.boolean  "admin",                                    :default => false
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "crypted_password",          :limit => 128, :default => "",    :null => false
    t.string   "salt",                      :limit => 128, :default => "",    :null => false
    t.string   "remember_token"
    t.string   "remember_token_expires_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "persistence_token"
    t.string   "single_access_token"
    t.string   "perishable_token"
    t.integer  "login_count",                              :default => 0,     :null => false
    t.integer  "failed_login_count",                       :default => 0,     :null => false
    t.datetime "last_request_at"
    t.datetime "current_login_at"
    t.datetime "last_login_at"
    t.string   "current_login_ip"
    t.string   "last_login_ip"
    t.string   "visible_username"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "facebook_uid",              :limit => 8
    t.string   "name"
  end

end
