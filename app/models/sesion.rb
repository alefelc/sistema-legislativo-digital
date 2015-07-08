class Sesion < ActiveRecord::Base
	belongs_to :diario_de_sesion
	has_one :orden_del_dia
end
