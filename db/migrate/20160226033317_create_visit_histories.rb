class CreateVisitHistories < ActiveRecord::Migration
  def change
    create_table :visit_histories do |t|
      t.integer :user_id
      t.integer :content_id

      t.timestamps null: false
    end
  end
end
