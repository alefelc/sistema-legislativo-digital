class Norma < ActiveRecord::Base

  # == Associations
  has_and_belongs_to_many :clasificacions
  has_and_belongs_to_many :circuitos
  has_and_belongs_to_many :boletin_oficials
  has_and_belongs_to_many :otra_publicacions
  has_and_belongs_to_many :tags
  has_many :capitulos_normas
  has_many :capitulos, through: :capitulos_normas
  has_many :destinos

  belongs_to :expediente

  has_many :estado_expedientes, as: :ref

  # == Recursive associations
  has_many :relationship_modificadas, class_name: 'ModificaRelationship', foreign_key: 'me_modifica_id'
  has_many :modificadas, through: :relationship_modificadas, source: :modifica
  has_many :relationship_me_modifican, class_name: 'ModificaRelationship', foreign_key: 'modifica_id'
  has_many :me_modifican, through: :relationship_me_modifican, source: :me_modifica

  def expedientes
    self.circuitos.map { |x| x.expediente }
  end

  def com_date
    date = self.destinos.where(tipo: 0).first()
    date.nil? ? nil : date.fecha
  end

  def com_dest
    dest = self.destinos.where(tipo: 0).first()
    dest.nil? ? "" : dest.destino
  end

  def not_date
    date = self.destinos.where(tipo: 1).first()
    date.nil? ? nil : date.fecha
  end

  def not_dest
    dest = self.destinos.where(tipo: 1).first()
    dest.nil? ? "" : dest.destino
  end

  def get_nro
    if self.nro.present?
      self.nro.to_s
    else
      " Numero no asignado"
    end    
  end

  def get_anio_sancion
    if self.sancion.present?
      " Año " + self.sancion.year.to_s
    else
      " - Año no asignado"
    end    
  end

  def get_sancion
    if self.sancion.present?
      " Sancionada el " + to_date(self.sancion).to_s
    else
      " Sancion no cargada"
    end    
  end

  def get_entrada_vigencia
    self.entrada_vigencia
  end

  def get_finaliza_vigencia
    self.finaliza_vigencia
  end  

  def get_plazo_vigencia
    ret = ""
    plazo_anio = self.plazo_anio.to_i.to_s + " años, " 
    plazo_mes = self.plazo_mes.to_i.to_s + " meses y "
    plazo_dia = self.plazo_dia.to_i.to_s + " dias "
    ret = plazo_anio + plazo_mes + plazo_dia
  end  

  def to_date date
    date.strftime("%d/%m/%Y")
  end

  def get_circuitos
    self.circuitos
  end  

  def get_relacion_me_modifican type
    self.relationship_me_modifican.where(tipo_relacion: type)    
  end

  def get_relacion_modifica type
    self.relationship_modificadas.where(tipo_relacion: type)    
  end

  def get_destinos type
    self.destinos.where(tipo: type)
  end

  def get_clasificaciones
    self.clasificacions
  end

  def get_descripcion
    self.descripcion
  end

  def get_observaciones
    self.observaciones
  end

  def get_organismo_origen
    self.organismo_origen
  end

  def get_tags
    self.tags
  end  

  def get_capitulos
    self.capitulos
  end  

  def get_sumario
    if self.sumario.present?
      self.sumario
    else
      " No tiene sumario"
    end    
  end  

end
