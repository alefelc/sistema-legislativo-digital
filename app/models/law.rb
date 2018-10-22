class Law < ActiveRecord::Base
  # == Associations
  has_and_belongs_to_many :legislative_file_states
  has_many :uploads
  belongs_to :legislative_session
  belongs_to :municipal_gazette
  belongs_to :enactment_decree_upload, class_name: 'Upload'

  # == Nested attributes
  accepts_nested_attributes_for :municipal_gazette, reject_if: :all_blank

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
    return if files.blank?
    files.each { |file| uploads.create file: file }
  end

  def legislative_files=(files)
    files = LegislativeFile.where id: files
    files.each do |file|
      self.legislative_file_states.create do |state|
        state.state_type = :parliamentary
        state.name = :sanctioned
      end
    end
  end
end
