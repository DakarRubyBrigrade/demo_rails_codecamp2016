json.array!(@salles) do |salle|
  json.extract! salle, :id, :nom
  json.url salle_url(salle, format: :json)
end
