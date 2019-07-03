json.id review.id
json.parent_id review.parent_id
json.nanny_id review.nanny_id
json.stars review.stars
json.comment review.comment
json.nanny do
  json.partial! review.nanny, partial: "/api/nannies/nanny", as: :nanny
end
json.parent do
  json.partial! review.parent, partial: "/api/parents/parent", as: :parent
end