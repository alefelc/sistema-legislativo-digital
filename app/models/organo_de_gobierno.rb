class OrganoDeGobierno < ActiveRecord::Base
  has_and_belongs_to_many :procedures
end
