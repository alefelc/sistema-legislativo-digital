class CircuitoOrden < ActiveRecord::Base
	belongs_to :circuito
	belongs_to :orden_del_dia
end
