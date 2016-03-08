class Despacho < Tramite

  #== Associations
	has_and_belongs_to_many :comisions, join_table: 'comisions_despachos'
	has_and_belongs_to_many :concejals, join_table: 'despachos_concejals'
	has_and_belongs_to_many :circuitos, join_table: 'circuitos_despachos'

  has_many :estado_expedientes, as: :ref

  def expedientes
    self.circuitos.map { |x| x.expediente }.uniq
  end

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
