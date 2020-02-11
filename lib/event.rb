
class Event < ActiveRecord::Base
  has_many :schedules
  has_many :users, through: :schedules

  def self.make_event(event)  ## only creates new event if doesn't already exist locally (Event table).
    if !Event.find_by(permalink: event.permalink)
      Event.create(title: event.title, date: event.date, category: event.category, permalink: event.permalink)
    else
      Event.find_by(permalink: event.permalink)
    end
  end

  def self.event_users
    
  end

  def self.all_users_all_events
    events = Event.all.sort { | a,b | a.date <=> b.date }
   
    events.each do |event|
      puts "Title: #{event.title} and Date:#{event.date}" 
        Schedule.all.each do |schedule| schedule.event_id = event.id 
          puts schedule.user
        end
      end
  end


end

