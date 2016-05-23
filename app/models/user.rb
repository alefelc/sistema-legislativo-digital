class User < ActiveRecord::Base
  #== Devise settings
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #== Associations
  has_and_belongs_to_many :roles
  belongs_to :person
  belongs_to :personal

  #== Validations
  # validates :roles, presence: true
  # validates :person, presence: true
end
