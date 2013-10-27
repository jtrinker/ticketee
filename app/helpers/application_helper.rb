module ApplicationHelper
	def title(*parts) # splat operator
		unless parts.empty?
			content_for :title do
				(parts << "Ticketee").join(" - ")
			end
		end
	end

	# this code takes a block -- the code b/t the do and end in the view.
	# in order to run the code inside the block you call block.call which
	# only runs if current_user.try(:admin?) returns true.
	# .try tries to run a method on an object and if the method doesn't exist
	# it returns nil instead of throwing a NoMethodError.
	def admins_only(&block)
		block.call if current_user.try(:admin?)
	end
end
