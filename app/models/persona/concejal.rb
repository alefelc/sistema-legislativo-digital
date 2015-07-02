class Concejal < Persona

  #== Associations
  has_and_belongs_to_many :periodos
  has_and_belongs_to_many :comisions
  belongs_to :bloque

end
