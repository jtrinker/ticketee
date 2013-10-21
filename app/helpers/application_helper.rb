module ApplicationHelper
	def title(*parts) # splat operator
		unless parts.empty?
			content_for :title do
				(parts << "Ticketee").join(" - ")
			end
		end
	end
end
