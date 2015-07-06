class Despacho < Tramite

  #== Associations
	has_and_belongs_to_many :comisions, join_table: 'comisions_despachos'
	has_and_belongs_to_many :concejals, join_table: 'despachos_concejals'
	belongs_to :expediente

end
