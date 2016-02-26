class AddVisitIdToVisithistories < ActiveRecord::Migration
  def change
    add_column :visit_histories, :visit_id, :integer
  end
end
