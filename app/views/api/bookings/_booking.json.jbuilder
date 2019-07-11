  json.id booking.id
  json.hours booking.hours
  json.start_date booking.start_date
  json.start_time booking.friendly_start_time
  json.end_time booking.friendly_end_time
  json.price booking.price
  json.notes booking.notes
  json.nanny do
    json.partial! booking.nanny, partial: "/api/nannies/nanny", as: :nanny
  end
  json.parent do
    json.partial! booking.parent, partial: "/api/parents/parent", as: :parent
  end