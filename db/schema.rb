# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2023_05_04_064127) do
  create_table "accounts", force: :cascade do |t|
    t.integer "user_id"
    t.integer "coins"
    t.string "referral_code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "app_opens", force: :cascade do |t|
    t.integer "user_id"
    t.string "versionName"
    t.string "versionCode"
    t.string "location"
    t.string "source_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fantasies", force: :cascade do |t|
    t.string "Title"
    t.string "Logo"
    t.string "signupBonus"
    t.string "Min_withdrawl"
    t.string "WithdrawlType"
    t.string "RefferalCode"
    t.string "TaskLink"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "games", force: :cascade do |t|
    t.string "gamename"
    t.string "gameurl"
    t.string "gameimgurl"
    t.string "gameamt"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "matches", force: :cascade do |t|
    t.string "match_title"
    t.string "match_short_title"
    t.string "match_views"
    t.string "match_status"
    t.string "front_team"
    t.string "opposite_team"
  end

  create_table "players", force: :cascade do |t|
    t.string "player_name"
    t.integer "team_id"
    t.text "category"
  end

  create_table "points_histories", force: :cascade do |t|
    t.integer "A_coins"
    t.string "account_id"
    t.string "Add_type_logo"
    t.string "Scheme_Name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "rewards", force: :cascade do |t|
    t.string "Trans_name"
    t.string "trans_type"
    t.string "trans_logo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "coins_amount"
    t.string "conversion_amount"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "taskname"
    t.string "taskimgurl"
    t.string "taskamt"
    t.string "taskval"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "teams", force: :cascade do |t|
    t.string "team_name"
    t.string "team_short_name"
    t.string "team_logo"
  end

  create_table "userprofiles", force: :cascade do |t|
    t.string "user_id"
    t.string "userEmail"
    t.string "userName"
    t.string "phoneNumber"
    t.string "DOB"
    t.string "Gender"
    t.string "profilePic"
    t.string "Occupation"
    t.string "Address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "deviceId"
    t.string "deviceType"
    t.string "deviceName"
    t.string "socialType"
    t.string "socialId"
    t.string "socialToken"
    t.string "securityToken"
    t.string "socialEmail"
    t.string "socialName"
    t.string "socialImgUrl"
    t.string "adverstisiingId"
    t.string "versionName"
    t.string "versionCode"
    t.string "utmSource"
    t.string "utmMedium"
    t.string "utmterm"
    t.string "utmContent"
    t.string "utmCampaign"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "withdrawl_histories", force: :cascade do |t|
    t.integer "account_id"
    t.integer "w_coins"
    t.string "Trans_type_logo"
    t.string "Transaction_ID"
    t.string "transaction_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
