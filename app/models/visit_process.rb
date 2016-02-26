class VisitProcess < ActiveRecord::Base
  def self.process
    vp = self.find_or_create_by :id => 1
    vp.update :next_id => Visit.process_from(vp.next_id || 1)
  end

  def self.reset
    vp = self.find_or_create_by :id => 1
    vp.update :next_id => 1
  end
end
