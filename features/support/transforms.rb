require 'date'

CAPTURE_A_DATE = Transform(/^(\d\d\d\d\-\d\d\-\d\d)$/) do |date|
  DateTime.strptime(date, '%Y-%m-%d')
end

CAPTURE_A_DATEOBJECT = Transform(/^\d+$/) do |dateobject|
  dateobject.to_date
end

CAPTURE_A_NUMBER = Transform(/^\d+$/) do |number|
  number.to_i
end

CAPTURE_ACCOUNT_NUMBER = Transform(/^\d+$/) do |accountid|
  accountid.to_s
end