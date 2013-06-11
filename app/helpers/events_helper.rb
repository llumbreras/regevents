module EventsHelper
	def format_price(event)
		if event.free?
			content_tag(:strong, "Free")
		else
			number_to_currency(event.price)
		end
	end

	def image_helper(event)
		if event.image_file_name.blank?
			image_tag('cal_image.png')
		else
			image_tag(event.image_file_name)
		end
	end
end
