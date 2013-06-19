class RegistrationsController < ApplicationController
	def index
		@event = Event.find(params[:event_id])
		@registrations = @event.registrations
	end
	def show
		@event = Event.find(params[:event_id])
		@registration = @event.registrations.find(params[:id])
	end
end
