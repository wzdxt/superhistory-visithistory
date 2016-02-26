class VisitHistory < ActiveRecord::Base
  def self.visit(user_id, content_id, time)
    vh = self.find_or_initialize_by :user_id => user_id, :content_id => content_id
    vh.update! :updated_at => time
  end
end
