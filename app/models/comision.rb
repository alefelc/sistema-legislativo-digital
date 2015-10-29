class Comision < ActiveRecord::Base

  #== Associations
	has_and_belongs_to_many :periodos
	has_and_belongs_to_many :concejals
	has_and_belongs_to_many :tramites
	has_and_belongs_to_many :despachos, join_table: 'comisions_despachos'

  has_many :estado_tramites, as: :ref

  def type
    'Comision'
  end  
end
