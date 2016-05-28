json.array!(@ateliers) do |atelier|
  json.extract! atelier, :id, :titre, :presente_par, :entreprise, :salle_id, :heure_debut, :heure_fin
  json.url atelier_url(atelier, format: :json)
end
