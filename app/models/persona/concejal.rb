class Concejal < Persona

  #== Associations
  has_and_belongs_to_many :periodos
  has_and_belongs_to_many :comisions
	has_and_belongs_to_many :despachos, join_table: 'despachos_concejals'
  belongs_to :bloque

  #== Association recursive suplencia
  has_many :suplentes, class_name: "RelationshipConcejal", foreign_key: "suplente_id"
  has_one :titular, class_name: "RelationshipConcejal", foreign_key: "titular_id"

end
