class Concejal < Persona

  #== Associations
  has_and_belongs_to_many :periodos
  has_and_belongs_to_many :comisions
	has_and_belongs_to_many :despachos, join_table: 'despachos_concejals'
  belongs_to :bloque

end
