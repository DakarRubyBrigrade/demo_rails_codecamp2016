class Atelier < ActiveRecord::Base
  belongs_to :salle

  validates :presente_par, :titre, :salle_id, :heure_debut, :heure_fin,
      presence: true

  validate :validation_heure_fin

  validate :disponibilite, unless: 'salle.nil?'

  def validation_heure_fin
    errors.add(:heure_fin, "doit être supérieure à l'heure de début") if heure_fin <= heure_debut

    errors[:base] << 'la présentation doit faire au moins 30 minutes' if heure_fin - heure_debut < 30.minutes
  end

  def disponibilite
    if Atelier.exists?(['heure_debut < ? and heure_fin > ?', self.heure_debut, self.heure_debut]) or
        Atelier.exists?(['heure_debut > ? and heure_fin < ?', self.heure_debut, self.heure_fin]) or
        Atelier.exists?(['heure_debut < ? and heure_fin > ?', self.heure_fin, self.heure_fin])
      errors[:base] << "'#{salle.nom}' ne sera pas disponible à cette heure"
    end
  end
end
