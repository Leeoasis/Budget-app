class CreateJoinTableCategoryRecord < ActiveRecord::Migration[7.0]
  def change
    create_join_table :categories, :records do |t|
      t.index [:category_id, :record_id]
      t.index [:record_id, :category_id]
    end
  end
end
