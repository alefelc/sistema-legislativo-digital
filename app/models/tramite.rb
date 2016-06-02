class Tramite < ActiveRecord::Base
	#== Associations
	has_and_belongs_to_many :persons
	has_and_belongs_to_many :bloques
	has_and_belongs_to_many :comisions
  has_and_belongs_to_many :organo_de_gobiernos
  has_and_belongs_to_many :dependencia_municipals, join_table: 'dependencias_tramites'
  has_and_belongs_to_many :reparticion_oficials
  has_and_belongs_to_many :areas
  has_many :estado_tramites
  has_many :expediente_administrativos
  belongs_to :circuito

  def to_date date
    date.strftime("%d/%m/%Y") unless date.nil?
  end

  def get_fecha
    to_date(self.fecha).to_s unless self.fecha.nil?
  end

  def get_fojas
    self.nro_fojas.to_s
  end

  def get_asunto
    self.asunto.to_s
  end

  def get_date_time
    self.updated_at
  end

  def get_observaciones
    self.observaciones
  end

  def get_iniciadores
    self.bloques.map{ |x| {type: "Bloque", denominacion: x.denominacion } }.to_a + self.comisions.map{ |x| {type: "Comision", denominacion: x.denominacion } }.to_a + self.reparticion_oficials.map{ |x| {type: "ReparticionOficial", denominacion: x.denominacion } }.to_a + self.dependencia_municipals.map{ |x| {type: "DependenciaMunicipal", denominacion: x.denominacion } }.to_a + self.organo_de_gobiernos.map{ |x| {type: "OrganoDeGobierno", denominacion: x.denominacion, codigo: x.codigo } }.to_a + self.areas.map{ |x| {type: "Area", denominacion: x.denominacion, codigo: x.codigo } }.to_a + self.persons.map{ |x| {type: x.type, apellido: x.apellido, nombre: x.nombre, bloque: x.try(:bloque).try(:denominacion) } }.to_a
  end
end
