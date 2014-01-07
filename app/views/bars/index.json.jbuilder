json.array!(@bars) do |bar|
  json.extract! bar, :id, :name, :foo_id
  json.url bar_url(bar, format: :json)
end
