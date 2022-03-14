

#this script anaylziz csv and returns the day of the
#week where most registrations took place

require 'csv'
require 'time'

def calculate_mode(arr)
  max_hash = Hash.new(0)
  arr.each { |hr| max_hash[hr] += 1 }
  max_hash.max_by { |_hr, ind| ind }[0]
end
puts 'Script Initialized.'
content = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

days = []
content.each { |row| days.push(Time.strptime(row[:regdate], '%m/%d/%Y %k:%M').wday) }

puts %(Finished processing!
Total entries: #{days.length}
Most registered wday: #{calculate_mode(days)})