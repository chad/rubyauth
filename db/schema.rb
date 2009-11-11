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

ActiveRecord::Schema.define(:version => 20091111154329) do

  create_table "client_applications", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.string   "support_url"
    t.string   "callback_url"
    t.string   "key",          :limit => 20
    t.string   "secret",       :limit => 40
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "client_applications", ["key"], :name => "index_client_applications_on_key", :unique => true

  create_table "delayed_jobs", :force => true do |t|
    t.integer  "priority",   :default => 0
    t.integer  "attempts",   :default => 0
    t.text     "handler"
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dependencies", :force => true do |t|
    t.string   "requirements"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "rubygem_id"
    t.integer  "version_id"
    t.string   "scope"
  end

  add_index "dependencies", ["rubygem_id"], :name => "index_dependencies_on_rubygem_id"
  add_index "dependencies", ["version_id"], :name => "index_dependencies_on_version_id"

  create_table "downloads", :force => true do |t|
    t.integer  "version_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "downloads", ["version_id"], :name => "index_downloads_on_version_id"

  create_table "linksets", :force => true do |t|
    t.integer  "rubygem_id"
    t.string   "home"
    t.string   "wiki"
    t.string   "docs"
    t.string   "mail"
    t.string   "code"
    t.string   "bugs"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "linksets", ["rubygem_id"], :name => "index_linksets_on_rubygem_id"

  create_table "oauth_nonces", :force => true do |t|
    t.string   "nonce"
    t.integer  "timestamp"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_nonces", ["nonce", "timestamp"], :name => "index_oauth_nonces_on_nonce_and_timestamp", :unique => true

  create_table "oauth_tokens", :force => true do |t|
    t.integer  "user_id"
    t.string   "type",                  :limit => 20
    t.integer  "client_application_id"
    t.string   "token",                 :limit => 20
    t.string   "secret",                :limit => 40
    t.string   "callback_url"
    t.string   "verifier",              :limit => 20
    t.datetime "authorized_at"
    t.datetime "invalidated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_tokens", ["token"], :name => "index_oauth_tokens_on_token", :unique => true

  create_table "ownerships", :force => true do |t|
    t.integer  "rubygem_id"
    t.integer  "user_id"
    t.string   "token"
    t.boolean  "approved",   :default => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ownerships", ["rubygem_id"], :name => "index_ownerships_on_rubygem_id"
  add_index "ownerships", ["user_id"], :name => "index_ownerships_on_user_id"

  create_table "rubygems", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "downloads",      :default => 0
    t.string   "slug"
    t.integer  "versions_count", :default => 0
  end

  add_index "rubygems", ["name"], :name => "index_rubygems_on_name"

  create_table "subscriptions", :force => true do |t|
    t.integer  "rubygem_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "subscriptions", ["rubygem_id"], :name => "index_subscriptions_on_rubygem_id"
  add_index "subscriptions", ["user_id"], :name => "index_subscriptions_on_user_id"

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "encrypted_password", :limit => 128
    t.string   "salt",               :limit => 128
    t.string   "token",              :limit => 128
    t.datetime "token_expires_at"
    t.boolean  "email_confirmed",                   :default => false, :null => false
    t.string   "api_key"
    t.string   "confirmation_token", :limit => 128
    t.string   "remember_token",     :limit => 128
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], :name => "index_users_on_email"
  add_index "users", ["id", "confirmation_token"], :name => "index_users_on_id_and_confirmation_token"
  add_index "users", ["id", "token"], :name => "index_users_on_id_and_token"
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"
  add_index "users", ["token"], :name => "index_users_on_token"

  create_table "versions", :force => true do |t|
    t.string   "authors"
    t.text     "description"
    t.string   "number"
    t.integer  "rubygem_id"
    t.datetime "built_at"
    t.datetime "updated_at"
    t.string   "rubyforge_project"
    t.text     "summary"
    t.string   "platform"
    t.datetime "created_at"
    t.boolean  "indexed",           :default => true
    t.boolean  "prerelease"
    t.integer  "position"
    t.integer  "downloads_count",   :default => 0
    t.boolean  "latest"
    t.string   "full_name"
  end

  add_index "versions", ["built_at"], :name => "index_versions_on_built_at"
  add_index "versions", ["created_at"], :name => "index_versions_on_created_at"
  add_index "versions", ["full_name"], :name => "index_versions_on_full_name"
  add_index "versions", ["indexed"], :name => "index_versions_on_indexed"
  add_index "versions", ["number"], :name => "index_versions_on_number"
  add_index "versions", ["position"], :name => "index_versions_on_position"
  add_index "versions", ["prerelease"], :name => "index_versions_on_prerelease"
  add_index "versions", ["rubygem_id"], :name => "index_versions_on_rubygem_id"

end
