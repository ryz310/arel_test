json.array!(@bazs) do |baz|
  json.extract! baz, :id, :name, :bar_id
  json.url baz_url(baz, format: :json)
end
