class Fisica < Person
  # == Validations
  #validates :nombre, :apellido, presence: true

  def text
    full_name
  end
end
