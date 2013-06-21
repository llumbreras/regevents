class Registration < ActiveRecord::Base
  belongs_to :event
  validates :name, presence: true
  validates :email, format: { with: /(\S+)@(\S+)/ }
  INFO_SOURCE_OPTIONS = [
  	'email',
  	'web',
  	'friend',
  	'other']
  validates :info_source,
  	inclusion: { in: INFO_SOURCE_OPTIONS }

end
