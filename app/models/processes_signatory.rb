class ProcessesSignatory < ActiveRecord::Base
  #== Associations
  belongs_to :process, class_name: 'Procedure'
  belongs_to :person, class_name: 'Person'
end
