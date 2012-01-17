# encoding: UTF-8
class Event < ActiveRecord::Base
  has_event_calendar
  belongs_to :player
  belongs_to :matchdate
end
