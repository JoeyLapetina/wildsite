module ApplicationHelper

	def order_items(an_array)
		items_ordered = an_array.sort! {|a, b| a.created_at <=> b.created_at }
	end
end
