json.partial! "nanny.json.jbuilder", nanny: @nanny
json.bookings do 
  json.array! @nanny.bookings, partial: 'api/bookings/booking', as: :booking
end
json.reviews do 
  json.array! @nanny.reviews, partial: 'api/reviews/review', as: :review
end





# json.parent_ids @nanny.parent_ids