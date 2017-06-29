class Tag < ActiveRecord::Base
  # == Associations
  has_many :legislative_files
  has_and_belongs_to_many :normas

  # == Methods
  def text
    self.name
  end
end
