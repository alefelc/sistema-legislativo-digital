class Law < ActiveRecord::Base
  # == Associations
  has_and_belongs_to_many :legislative_file_states
  has_many :destinies
  has_many :uploads

  accepts_nested_attributes_for :destinies, reject_if: :all_blank

  # == Enums
  enum law_type: [:ordenanza, :decreto, :declaracion, :resolucion, :especial, :otra_norma]

  def text
    "##{number} / #{letter} / #{year} (#{I18n.t "laws.types.#{law_type}" })"
  end

  def to_s
    return "##{number} / #{letter} / #{year}" if letter.present?
    "##{number} / #{year}"
  end

  def uploads=(files)
    files.each { |file| uploads.create file: file }
  end
end
