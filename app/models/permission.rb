class Permission < ActiveRecord::Base
	belongs_to :user

	# Anything that has object_id in its table is going to belong to that Object
	# A polymorphic assoc. uses thing_type/_id to determine what object a Permission relates to -
	# namely, Project, Ticket, etc.
	belongs_to :thing, polymorphic: true
	
end
