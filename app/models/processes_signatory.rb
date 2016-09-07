class ProcessesSignatory < ActiveRecord::Base
  #== Associations
  belongs_to :process, class_name: 'Tramite'
  belongs_to :person, class_name: 'Person'
end
