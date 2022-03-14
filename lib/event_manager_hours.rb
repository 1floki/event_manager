# frozen_string_literal: true

# this script parses register time in the CSV file in root
# directory and gives the mode of registered time

require 'csv'
require 'time'

def calculate_mode(arr)
  max_hash = Hash.new(0)
  arr.each { |hr| max_hash[hr] += 1 }
  max_hash.max_by { |_hr, ind| ind }[0]
end
puts 'Script Initialized.'
content = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

hours = []
content.each { |row| hours.push(Time.strptime(row[:regdate], '%m/%d/%Y %k:%M').hour) }

puts %(Finished processing!
Total entries: #{hours.length}
Most registered hour: #{calculate_mode(hours)})
