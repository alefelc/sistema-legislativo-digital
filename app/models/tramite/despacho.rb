class Despacho < Tramite

  #== Associations
	has_and_belongs_to_many :comisions, join_table: 'comisions_despachos', dependent: :destroy
  accepts_nested_attributes_for :comisions, allow_destroy: true
	has_and_belongs_to_many :concejals, join_table: 'despachos_concejals', dependent: :destroy
  accepts_nested_attributes_for :concejals, allow_destroy: true
	#belongs_to :expediente
  has_and_belongs_to_many :expedientes, join_table: 'expedientes_despachos', dependent: :destroy
  accepts_nested_attributes_for :expedientes, allow_destroy: true

end
