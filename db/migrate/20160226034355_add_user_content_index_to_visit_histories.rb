class AddUserContentIndexToVisitHistories < ActiveRecord::Migration
  def change
    add_index :visit_histories, [:user_id, :content_id]
  end
end
