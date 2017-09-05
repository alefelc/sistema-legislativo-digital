class Upload < ActiveRecord::Base
  #== Associations
  belongs_to :procedure

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
end
