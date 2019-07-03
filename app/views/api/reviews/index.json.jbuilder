json.array! @reviews.each do |review|
  json.partial! "review.json.jbuilder", review: review
end