class RegistrationsController < ApplicationController
	def index
		@event = Event.find(params[:event_id])
		@registrations = @event.registrations
	end
	def show
		@event = Event.find(params[:event_id])
		@registration = @event.registrations.find(params[:id])
	end
	def new
		@event = Event.find(params[:event_id])
		@registration = @event.registrations.new
	end
	def create
		@event = Event.find(params[:event_id])
		@registration = @event.registrations.new(registration_params)
		if @registration.save
			redirect_to event_registrations_path(@event), notice: "Success!"
		else
			render :new
		end
	end

private
	def registration_params
		params.require(:registration).
		permit(:name, :email, :info_source)
	end
end
