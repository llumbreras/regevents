# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  location        :string(255)
#  price           :decimal(, )
#  created_at      :datetime
#  updated_at      :datetime
#  starts_at       :datetime
#  description     :text
#  image_file_name :string(255)
#  capacity        :integer
#

class Event < ActiveRecord::Base
	def free?
		price.blank? || price.zero?
	end

	def self.upcoming
		where("starts_at >= ?", Time.now).order("starts_at")
	end
end
