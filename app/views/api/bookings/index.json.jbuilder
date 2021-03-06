# json.array! @bookings.each do |booking|
#   json.id booking.id
#   json.parent_id booking.parent_id
#   json.nanny_id booking.nanny_id
#   json.hours booking.hours
#   json.start_time booking.start_time
#   json.price booking.price
# end

json.array! @bookings.each do |booking|
  json.partial! "booking.json.jbuilder", booking: booking
end