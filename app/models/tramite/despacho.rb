class Despacho < Tramite

  #== Associations
	has_and_belongs_to_many :comisions, join_table: 'comisions_despachos'
	has_and_belongs_to_many :concejals, join_table: 'despachos_concejals'
	has_and_belongs_to_many :expedientes, join_table: 'expedientes_despachos'

  def get_expedientes
    self.expedientes
  end

  def get_comisiones
    self.comisions
  end
  
  def get_concejales
    self.concejals
  end  

end
