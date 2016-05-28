class Salle < ActiveRecord::Base
  validates :nom, presence: true
end
