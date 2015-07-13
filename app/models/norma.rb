class Norma < ActiveRecord::Base

  # == Associations
  has_and_belongs_to_many :clasificacions
  has_and_belongs_to_many :circuitos
  has_and_belongs_to_many :capitulos
  has_and_belongs_to_many :boletin_oficials
  has_and_belongs_to_many :otra_publicacions
  has_many :destinos

  belongs_to :expediente

  # == Recursive associations
  has_many :relationship_aclaradas, class_name: 'AclaraRelationship', foreign_key: 'aclarada_id'
  has_many :aclaradas, through: :relationship_aclaradas
  has_many :relationship_me_aclaran, class_name: 'AclaraRelationship', foreign_key: 'me_aclara_id'
  has_many :me_aclaran, through: :relationship_me_aclaran, source: :me_aclara

  has_many :relationship_delegadas, class_name: 'DelegaRelationship', foreign_key: 'delega_id'
  has_many :delegadas, through: :relationship_delegadas, source: :delega
  has_many :relationship_me_delegan, class_name: 'DelegaRelationship', foreign_key: 'me_delega_id'
  has_many :me_delegan, through: :relationship_me_delegan, source: :me_delega

  has_many :relationship_derogadas, class_name: 'DerogaRelationship', foreign_key: 'derogada_id'
  has_many :derogadas, through: :relationship_derogadas, source: :derogada
  has_many :relationship_me_derogan, class_name: 'DerogaRelationship', foreign_key: 'me_deroga_id'
  has_many :me_derogan, through: :relationship_me_derogan, source: :me_deroga

  has_many :relationship_modificadas, class_name: 'ModificaRelationship', foreign_key: 'modifica_id'
  has_many :modificadas, through: :relationship_modificadas, source: :modifica
  has_many :relationship_me_modifican, class_name: 'ModificaRelationship', foreign_key: 'me_modifica_id'
  has_many :me_modifican, through: :relationship_me_modifican, source: :me_modifica

  has_many :relationship_reglamentadas, class_name: 'ReglamentaRelationship', foreign_key: 'reglamenta_id'
  has_many :reglamentadas, through: :relationship_reglamentadas, source: :reglamenta
  has_many :relationship_me_reglamentan, class_name: 'ReglamentaRelationship', foreign_key: 'me_reglamenta_id'
  has_many :me_reglamentan, through: :relationship_me_reglamentan, source: :me_reglamenta

  has_many :relationship_prorroga_vigencia, class_name: 'ProrrogaVigenciaRelationship', foreign_key: 'prorroga_id'
  has_many :prorroga_vigencia, through: :relationship_prorroga_vigencia, source: :prorroga
  has_many :relationship_me_prorrogan_vigencia, class_name: 'ProrrogaVigenciaRelationship', foreign_key: 'me_prorroga_id'
  has_many :me_prorrogan_vigencia, through: :relationship_me_prorrogan_vigencia, source: :me_prorroga

  has_many :relationship_prorroga_suspencion, class_name: 'ProrrogaSuspencionRelationship', foreign_key: 'suspendida_id'
  has_many :prorroga_suspencion, through: :relationship_prorroga_suspencion, source: :suspendida
  has_many :relationship_me_prorrogan_suspencion, class_name: 'ProrrogaSuspencionRelationship', foreign_key: 'me_suspende_id'
  has_many :me_prorrogan_suspencion, through: :relationship_me_prorrogan_suspencion, source: :me_suspende

  has_many :relationship_restituye_vigencia, class_name: 'RestituyeVigenciaRelationship', foreign_key: 'restituye_id'
  has_many :restituye_vigencia, through: :relationship_restituye_vigencia, source: :restituye
  has_many :relationship_me_restituyen_vigencia, class_name: 'RestituyeVigenciaRelationship', foreign_key: 'me_restituye_id'
  has_many :me_restituyen_vigencia, through: :relationship_me_restituyen_vigencia, source: :me_restituye

  has_many :relationship_suspende_vigencia, class_name: 'SuspendeVigenciaRelationship', foreign_key: 'suspende_id'
  has_many :suspende_vigencia, through: :relationship_suspende_vigencia, source: :suspende
  has_many :relationship_me_suspenden_vigencia, class_name: 'SuspendeVigenciaRelationship', foreign_key: 'me_suspende_id'
  has_many :me_suspenden_vigencia, through: :relationship_me_suspenden_vigencia, source: :me_suspende
end
