class Seccion < ActiveRecord::Base
	has_and_belongs_to_many :orden_del_dias
	has_many :sub_seccions
end
