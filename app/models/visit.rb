class Visit < ActiveRecord::Base
  visit = self.arel_table
  scope :from_id, -> (start_id) { where(visit[:id].gteq(start_id)).order(:id) }
  establish_connection :visit

  def self.process_from(start_id)
    next_id = -1
    wait_list = self.from_id(start_id)
    wait_list.each do |v|
      if v.page_id and page = Page.find_by_id(v.page_id) and page.PROCESSED?
        until page.target_page.nil? or page.target_page == page
          page = page.target_page
        end
        if Content.exists? page.id
          VisitHistory.visit(v.user_id, page.id, v.created_at, v.id)
        end
      else
        break next_id = v.id
      end
    end
    if next_id > 0 then
      next_id
    else
      wait_list.present? ? self.from_id(start_id).last.id + 1 : start_id
    end
  end
end
