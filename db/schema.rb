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

ActiveRecord::Schema[7.0].define(version: 20_230_707_105_837) do
  enable_extension 'plpgsql'

  create_table 'categories', force: :cascade do |t|
    t.string 'name'
    t.string 'icon'
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end

ActiveRecord::Schema[7.0].define(version: 20_230_707_105_837) do
  enable_extension 'plpgsql'

  create_table 'categories_records', id: false, force: :cascade do |t|
    t.bigint 'category_id', null: false
    t.bigint 'record_id', null: false
    t.index %w[category_id record_id], name: 'index_categories_records_on_category_id_and_record_id'
    t.index %w[record_id category_id], name: 'index_categories_records_on_record_id_and_category_id'
  end
end

ActiveRecord::Schema[7.0].define(version: 20_230_707_105_837) do
  enable_extension 'plpgsql'

  create_table 'records', force: :cascade do |t|
    t.string 'name'
    t.decimal 'amount'
    t.bigint 'author_id', null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.index ['author_id'], name: 'index_records_on_author_id'
  end
end

ActiveRecord::Schema[7.0].define(version: 20_230_707_105_837) do
  enable_extension 'plpgsql'

  create_table 'users', force: :cascade do |t|
    t.string 'name', limit: 50, null: false
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
    t.string 'email', default: '', null: false
    t.string 'encrypted_password', default: '', null: false
    t.string 'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.index ['email'], name: 'index_users_on_email', unique: true
    t.index ['reset_password_token'], name: 'index_users_on_reset_password_token', unique: true
  end
end

ActiveRecord::Schema[7.0].define(version: 20_230_707_105_837) do
  add_foreign_key 'records', 'users', column: 'author_id'
end
