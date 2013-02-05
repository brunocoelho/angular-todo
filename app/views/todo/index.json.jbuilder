json.array!(@todos) do |json, todo|
  json.id          todo.id
  json.description todo.description
  json.done        todo.done
end
