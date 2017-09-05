## Intermediate table between signators and procedures
class ProcessesSignatory < ActiveRecord::Base
  #== Associations
  belongs_to :procedure
  belongs_to :procedure_signatory
end
