json.array! @nannies.each do |nanny|
  json.partial! "nanny.json.jbuilder", nanny: nanny
end