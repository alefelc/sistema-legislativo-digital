class LegislativeSession < ActiveRecord::Base
	belongs_to :diario_de_sesion
  has_many :legislative_file_states
	has_many :laws
	has_one :orden_del_dia

  enum session_type: [:ordinary, :extraordinary, :intermediate_room, :special]

  def text
    self.number
  end

  def to_s
    "##{self.number}"
  end
end
