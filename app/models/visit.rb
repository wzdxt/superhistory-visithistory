class Visit < ActiveRecord::Base
  visit = self.arel_table
  scope :from_id, -> (start_id) { where(visit[:id].gteq(start_id)).order(:id) }
  establish_connection :visit

  def self.process_from(start_id)
    next_id = -1
    self.from_id(start_id).each do |v|
      if v.page_id and page = Page.find_by_id(v.page_id) and page.CAN_VIEW?
        until page.target_page.nil? or page.target_page == page
          page = page.target_page
        end
        VisitHistory.visit(v.user_id, page.id, v.created_at, v.id)
      else
        break next_id = v.id
      end
    end
    next_id > 0 ? next_id : self.from_id(start_id).last.id + 1
  end
end
