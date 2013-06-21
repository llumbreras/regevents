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

		has_many :registrations, dependent: :destroy
		validates :name, :location, presence: true
		validates :description, length: { minimum: 25 }
		validates :price, numericality: { greater_than_or_equal_to: 0 }
		validates :capacity, numericality: { only_integer: true, greater_than: 0}
		validates :image_file_name, allow_blank: true, format: {
			with: /\w+.(gif|jpg|png)\z/i,
			message: "must be of .gif, .jpg, or .png type"
		}


	def free?
		price.blank? || price.zero?
	end

	def self.upcoming
		where("starts_at >= ?", Time.now).order("starts_at")
	end

	def spaces_left
		capacity - registrations.size
	end
end
