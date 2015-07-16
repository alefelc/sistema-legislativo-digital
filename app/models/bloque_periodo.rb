class BloquePeriodo < ActiveRecord::Base
  belongs_to :bloque
  belongs_to :periodo
end
