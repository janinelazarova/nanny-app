json.partial! "parent.json.jbuilder", parent: @parent

# json.array! @parent.bookings.each do |booking|
#   json.booking_id booking.id
#   json.nanny_id booking.nanny_id
#   json.hours booking.hours
#   json.start_time booking.start_time
#   json.end_time booking.end_time
#   json.price booking.price 
# end


json.bookings do 
  json.array! @parent.bookings, partial: "/api/bookings/booking", as: :booking
end
json.reviews do 
  json.array! @parent.reviews, partial: "/api/reviews/review", as: :review
end