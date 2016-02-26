class Page < ActiveRecord::Base
  establish_connection :page
  belongs_to :target_page, :class_name => Page.name
  module STATUS
    NOT_PROCESSED = 10
    SUCCESS = 20
    REDIRECT = 30
    ERROR_ON_OPEN = 40
    ERROR_OTHER = 50
    HTTP_STATUS_NOT_200 = 110
    SAME_CONTENT_HASH = 120
  end

  include StatusFeature

  def CAN_VIEW?
    self.SUCCESS? or self.REDIRECT? or self.SAME_CONTENT_HASH?
  end

end
