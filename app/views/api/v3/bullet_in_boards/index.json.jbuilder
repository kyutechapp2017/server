json.array!(@bulletinboards) do |bulletinboard|
  json.url bulletinboard.url
  # json.title calculate_age(bulletinboard.birthday)
end
# json.array! @bulletinboards, :id, :title
