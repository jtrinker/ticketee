class Permission < ActiveRecord::Base
	belongs_to :user

	# Anything that has object_id in its table is going to belong to that Object
	belongs_to :thing, polymorphic: true
end
