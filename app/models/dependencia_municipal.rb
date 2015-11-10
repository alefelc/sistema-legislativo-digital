class DependenciaMunicipal < ActiveRecord::Base
  has_and_belongs_to_many :tramites, join_table: 'dependencias_tramites'

  def type
    'DependenciaMunicipal'
  end
end
