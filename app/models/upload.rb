class Upload < ActiveRecord::Base
  #== Associations
  belongs_to :procedure
  belongs_to :legislative_file
  belongs_to :law

  #== Attachment
  has_attached_file :file, { preserve_files: "true" }

  #== Validations
  validates :file, attachment_presence: true
  validates_attachment :file,
  content_type: {
    content_type: ["image/jpg", "image/jpeg", "image/png", "application/msword",
      "application/pdf", "text/plain", "application/vnd.ms-excel", "image/gif",
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"]
  },
  message: ", Unicamente Imágenes, PDF, EXCEL, WORD o Archivo de TEXTO están permitidos."

  def thumb
    return self.file.url(:thumb) if self.can_thumbnail?
    '/thumb/default.png'
  end

  private

  def can_thumbnail?
    self.check_file_type.try(:[], :thumb).present?
  end
end
