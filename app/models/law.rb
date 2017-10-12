class Law < ActiveRecord::Base
  # == Associations
  has_and_belongs_to_many :legislative_file_states
  has_many :destinies

  accepts_nested_attributes_for :destinies

  # == Enums
  enum law_type: [:ordenanza, :decreto, :declaracion, :resolucion, :especial, :otra_norma]

  def text
    "#{number} / #{letter} / #{year} (#{I18n.t "laws.types.#{law_type}" })"
  end

  def to_s
    "#{number}/#{letter}/#{year}"
  end
end
