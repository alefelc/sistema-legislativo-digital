
class LegacyPart < ActiveRecord::Base 
	establish_connection :legacy 
	self.table_name = 'PART'
end