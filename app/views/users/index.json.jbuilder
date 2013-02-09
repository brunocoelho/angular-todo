json.array!(@users) do |json, user|
  json.id   user.id
  json.name user.name
end
