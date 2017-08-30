class Law < ActiveRecord::Base
  # == Associations
  has_and_belongs_to_many :legislative_file_states

  # == Enums
  enum law_type: [:ordenanza, :decreto, :declaracion, :resolucion, :especial, :otra_norma]

  def text
    "#{number} / #{letter} / #{year}"
  end
end
