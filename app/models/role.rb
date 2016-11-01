class Role < ActiveRecord::Base
 #== Associations
  has_and_belongs_to_many :users

  #== Validations
  validates :name, presence: true

  #== Scopes
  scope :for_staff, -> { where(admin: false) }

  def has?(activity)
    activities.include?(activity)
  end

  def to_s
    name
  end
end
