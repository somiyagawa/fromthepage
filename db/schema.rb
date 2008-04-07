# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of ActiveRecord to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 32) do

  create_table "article_article_links", :force => true do |t|
    t.integer  "source_article_id"
    t.integer  "target_article_id"
    t.string   "display_text"
    t.datetime "created_on"
  end

  add_index "article_article_links", ["source_article_id"], :name => "index_article_article_links_on_source_article_id"
  add_index "article_article_links", ["target_article_id"], :name => "index_article_article_links_on_target_article_id"

  create_table "article_versions", :force => true do |t|
    t.string   "title"
    t.text     "source_text"
    t.text     "xml_text"
    t.integer  "user_id"
    t.integer  "article_id"
    t.integer  "version",     :default => 0
    t.datetime "created_on"
  end

  add_index "article_versions", ["article_id"], :name => "index_article_versions_on_article_id"
  add_index "article_versions", ["user_id"], :name => "index_article_versions_on_user_id"

  create_table "articles", :force => true do |t|
    t.string   "title"
    t.text     "source_text"
    t.datetime "created_on"
    t.integer  "lock_version",  :default => 0
    t.text     "xml_text"
    t.string   "graph_image"
    t.integer  "collection_id"
  end

  add_index "articles", ["collection_id"], :name => "index_articles_on_collection_id"

  create_table "articles_categories", :id => false, :force => true do |t|
    t.integer "article_id"
    t.integer "category_id"
  end

  create_table "categories", :force => true do |t|
    t.string   "title"
    t.integer  "parent_id"
    t.integer  "collection_id"
    t.datetime "created_on"
  end

  add_index "categories", ["collection_id"], :name => "index_categories_on_collection_id"
  add_index "categories", ["parent_id"], :name => "index_categories_on_parent_id"

  create_table "collections", :force => true do |t|
    t.string   "title"
    t.integer  "owner_user_id"
    t.datetime "created_on"
  end

  add_index "collections", ["owner_user_id"], :name => "index_collections_on_owner_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "parent_id"
    t.integer  "user_id"
    t.datetime "created_at",                                               :null => false
    t.integer  "commentable_id",                 :default => 0,            :null => false
    t.string   "commentable_type",               :default => "",           :null => false
    t.integer  "depth"
    t.string   "title"
    t.text     "body"
    t.string   "comment_type",     :limit => 10, :default => "annotation"
    t.string   "comment_status",   :limit => 10
  end

  create_table "deeds", :force => true do |t|
    t.string   "deed_type",     :limit => 10
    t.integer  "page_id"
    t.integer  "work_id"
    t.integer  "collection_id"
    t.integer  "article_id"
    t.integer  "user_id"
    t.integer  "note_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "deeds", ["article_id"], :name => "index_deeds_on_article_id"
  add_index "deeds", ["page_id"], :name => "index_deeds_on_page_id"
  add_index "deeds", ["work_id"], :name => "index_deeds_on_work_id"
  add_index "deeds", ["collection_id"], :name => "index_deeds_on_collection_id"
  add_index "deeds", ["user_id"], :name => "index_deeds_on_user_id"
  add_index "deeds", ["note_id"], :name => "index_deeds_on_note_id"

  create_table "image_sets", :force => true do |t|
    t.string   "path"
    t.string   "title_format"
    t.datetime "created_on"
    t.integer  "orientation"
    t.integer  "original_width"
    t.integer  "original_height"
    t.integer  "original_to_base_halvings"
    t.integer  "owner_user_id"
  end

  add_index "image_sets", ["owner_user_id"], :name => "index_image_sets_on_owner_user_id"

  create_table "interactions", :force => true do |t|
    t.integer  "user_id"
    t.integer  "collection_id"
    t.integer  "work_id"
    t.integer  "page_id"
    t.string   "action",        :limit => 20
    t.string   "params"
    t.string   "browser",       :limit => 128
    t.string   "session_id",    :limit => 40
    t.string   "ip_address",    :limit => 16
    t.datetime "created_on"
    t.string   "status",        :limit => 10
    t.string   "origin_link",   :limit => 20
  end

  add_index "interactions", ["session_id"], :name => "index_interactions_on_session_id"

  create_table "notes", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.integer  "collection_id"
    t.integer  "work_id"
    t.integer  "page_id"
    t.integer  "parent_id"
    t.integer  "depth"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_article_links", :force => true do |t|
    t.integer  "page_id"
    t.integer  "article_id"
    t.string   "display_text"
    t.datetime "created_on"
  end

  add_index "page_article_links", ["page_id"], :name => "index_page_article_links_on_page_id"
  add_index "page_article_links", ["article_id"], :name => "index_page_article_links_on_article_id"

  create_table "page_versions", :force => true do |t|
    t.string   "title"
    t.text     "transcription"
    t.text     "xml_transcription"
    t.integer  "user_id"
    t.integer  "page_id"
    t.integer  "work_version",      :default => 0
    t.integer  "page_version",      :default => 0
    t.datetime "created_on"
  end

  add_index "page_versions", ["page_id"], :name => "index_page_versions_on_page_id"
  add_index "page_versions", ["user_id"], :name => "index_page_versions_on_user_id"

  create_table "pages", :force => true do |t|
    t.string   "title"
    t.text     "source_text"
    t.string   "base_image"
    t.integer  "base_width"
    t.integer  "base_height"
    t.integer  "shrink_factor"
    t.integer  "work_id"
    t.datetime "created_on"
    t.integer  "position"
    t.integer  "lock_version",  :default => 0
    t.text     "xml_text"
  end

  add_index "pages", ["work_id"], :name => "index_pages_on_work_id"

  create_table "plugin_schema_info", :id => false, :force => true do |t|
    t.string  "plugin_name"
    t.integer "version"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :default => "", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "titled_images", :force => true do |t|
    t.string   "original_file",                  :default => "",    :null => false
    t.string   "title_seed",       :limit => 20
    t.string   "title_override"
    t.string   "title"
    t.boolean  "shrink_completed",               :default => false
    t.boolean  "rotate_completed",               :default => false
    t.boolean  "crop_completed",                 :default => false
    t.integer  "image_set_id"
    t.integer  "position"
    t.datetime "created_on"
    t.integer  "lock_version",                   :default => 0
  end

  add_index "titled_images", ["image_set_id"], :name => "index_titled_images_on_image_set_id"

  create_table "transcribe_authorizations", :id => false, :force => true do |t|
    t.integer "user_id"
    t.integer "work_id"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "display_name"
    t.string   "print_name"
    t.string   "email"
    t.boolean  "owner",                                   :default => false
    t.boolean  "admin",                                   :default => false
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
  end

  add_index "users", ["login"], :name => "index_users_on_login"

  create_table "works", :force => true do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_on"
    t.integer  "owner_user_id"
    t.boolean  "restrict_scribes",          :default => false
    t.integer  "transcription_version",     :default => 0
    t.text     "physical_description"
    t.text     "document_history"
    t.text     "permission_description"
    t.string   "location_of_composition"
    t.string   "author"
    t.text     "transcription_conventions"
    t.integer  "collection_id"
  end

  add_index "works", ["owner_user_id"], :name => "index_works_on_owner_user_id"
  add_index "works", ["collection_id"], :name => "index_works_on_collection_id"

end
