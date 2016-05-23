class Role < ActiveRecord::Base
  has_and_belongs_to_many :users

  validates :rol_type, presence: true
end
