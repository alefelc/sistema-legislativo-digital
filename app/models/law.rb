class Law < ActiveRecord::Base
  #== Enums
  enum law_type: [:ordenanza, :decreto, :declaracion, :resolucion, :especial, :otra_norma]
end
