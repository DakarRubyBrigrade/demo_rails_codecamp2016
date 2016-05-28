class CreateAteliers < ActiveRecord::Migration
  def change
    create_table :ateliers do |t|
      t.string :titre
      t.string :presente_par
      t.string :entreprise
      t.references :salle, index: true, foreign_key: true
      t.time :heure_debut
      t.time :heure_fin

      t.timestamps null: false
    end
  end
end
