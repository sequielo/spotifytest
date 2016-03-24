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

ActiveRecord::Schema.define(:version => 20160324213513) do

  create_table "djs", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "spotify_artists", :force => true do |t|
    t.string   "name"
    t.integer  "popularity"
    t.string   "avatar_url"
    t.string   "genres"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "spotify_id"
  end

  create_table "spotify_tracks", :force => true do |t|
    t.string   "name"
    t.integer  "duration"
    t.integer  "track_number"
    t.integer  "disc_number"
    t.string   "preview_url"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "album"
    t.string   "spotify_id"
    t.integer  "spotify_artist_id"
  end

end
