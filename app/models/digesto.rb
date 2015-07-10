class Digesto < ActiveRecord::Base

  # == Associations
  has_many :libros
  has_many :titulos, through: :libros
  has_many :capitulos, through: :titulos

end
