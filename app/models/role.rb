class Role < ActiveRecord::Base
  # == Associations
  has_and_belongs_to_many :users

  # == Validations
  validates :name, presence: true

  # == Scopes
  scope :for_staff, -> { where(admin: false) }

  def has?(activity)
    activities.include?(activity)
  end

  def has_role?(activity, role)
    activity = activity.to_s
    role = role.to_s
    activities.select { |x| x.include? activity }
     .map{ |x| x.split(":").second }.include? role
  end

  def to_s
    name
  end

  def text
    name
  end
end
