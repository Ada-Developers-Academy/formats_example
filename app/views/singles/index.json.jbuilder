json.array!(@singles) do |single|
  json.extract! single, :id, :title, :artist, :length, :release_date
  json.url single_url(single, format: :json)
end
