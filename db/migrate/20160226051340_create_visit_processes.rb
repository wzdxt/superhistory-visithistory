class CreateVisitProcesses < ActiveRecord::Migration
  def change
    create_table :visit_processes do |t|
      t.integer :next_id

      t.timestamps null: false
    end
  end
end
