class Libro < ActiveRecord::Base

  # == Associations
  belongs_to :digesto
  has_many :titulos
  has_many :capitulos, through: :titulos

end
