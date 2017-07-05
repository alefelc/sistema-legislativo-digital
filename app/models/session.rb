class Session < ActiveRecord::Base
	belongs_to :diario_de_sesion
  has_many :legislative_file_states
	has_one :orden_del_dia

  enum session_type: [:ordinary, :extraordinary, :intermediate_room, :special]
end
