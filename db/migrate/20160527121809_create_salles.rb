class CreateSalles < ActiveRecord::Migration
  def change
    create_table :salles do |t|
      t.string :nom, null: false

      t.timestamps null: false
    end
  end
end
