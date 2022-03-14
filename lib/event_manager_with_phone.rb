# frozen_string_literal: true

require 'csv'

puts 'EventManager started...'

file = CSV.open('event_attendees.csv', headers: true, header_converters: :symbol)

def clean_phone_number(number)
  number = number.gsub(/\D/, '')
  if number.length == 10
    number
  elsif number.length == 11 && number[0] == '1'
    number[1..-1]
  else
    'Bad Number'
  end
end

file.each do |row|
  phone_number = clean_phone_number(row[:homephone])
  puts phone_number
end
