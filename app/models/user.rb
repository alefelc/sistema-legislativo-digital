class User < ActiveRecord::Base
  # == Devise settings
  devise :database_authenticatable, :recoverable, :rememberable,
    :trackable, :validatable#, :registerable

  # == Associations
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :areas
  belongs_to :person
  belongs_to :personal

  # == Validations
  validates :roles, presence: true
  validates :person, presence: true

  # == PaperTrail changes tracker
  has_paper_trail

  # == Check if an user belongs to an area
  # option can be:
  #   :reception_table
  #   :legislative_secretary
  def belongs_to_area?(option)
    case option
    when :reception_table
      areas.where(name: 'Mesa de Entradas').present? || admin?
    when :legislative_secretary
      areas.where(name: 'Secretaria Legislativa').present? || admin?
    end
  end

  def area_id
    areas.first.try :id
  end
end
