class Upload < ActiveRecord::Base
  #== Associations
  belongs_to :tramite

  has_attached_file :file, {
    preserve_files: "true",
  }
end
